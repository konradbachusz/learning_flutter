import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'userprofile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isActive = false;
  var _globalKey = GlobalKey<FormState>();
  var user = UserProfile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carved Rock Fitness'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _globalKey,
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'First Name is Required';
                    }
                  },
                  onSaved: (value) {
                    user.firstName = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Last Name is Required';
                    }
                  },
                  onSaved: (value) {
                    user.lastName = value;
                  },
                ),
                DropdownButtonFormField(
                  onChanged: (newValue) {},
                  items: [
                    ['Lose Weight', 1],
                    ['Build Muscle', 2],
                    ['Train For a Sport', 3],
                    ['Recreation', 4]
                  ].map((item) {
                    return DropdownMenuItem(
                        child: Text(item[0]), value: item[1]);
                  }).toList(),
                  onSaved: (value) {
                    user.fitnessGoal = value;
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(hintText: 'Loyalty Points'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (int.parse(value) < 1) {
                        return 'Loyalty Points Cannot Be Less Than 1';
                      }
                    },
                    onSaved: (value) {
                      user.loyaltyPoints = int.parse(value);
                    }),
                SwitchListTile(
                  title: Text('Is Active'),
                  onChanged: (newValue) {
                    setState(() {
                      _isActive = newValue;
                      user.isActive = _isActive;
                    });
                  },
                  value: _isActive,
                ),
              ]),
            ),
            RaisedButton(
              onPressed: () async {
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();
                  // var response = await http.post('http://10.0.2.2:5000/profile',
                  //     body: user.toJson(),
                  //     headers: {'Content-type': 'application/json'});
                  var httpClient = HttpClient();
                  var request =
                      await httpClient.post('10.0.2.2', 5000, '/profile');
                  request.headers.contentType = ContentType.json;
                  request.write(user.toJson());
                  var response = await request.close();
                  var stringBuffer = StringBuffer();
                  response.transform(utf8.decoder).listen((chunk) {
                    stringBuffer.write(chunk);
                  });
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: Text('Message'),
                            content: Text(
                                '${stringBuffer.toString()}, ${response.statusCode}'),
                            actions: [
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ]);
                      });
                }
              },
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
