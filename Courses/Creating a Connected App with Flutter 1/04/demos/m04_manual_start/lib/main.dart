import 'package:flutter/material.dart';

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
  final _globalKey = GlobalKey<FormState>();
  var userProfile = UserProfile();
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
                  validator: (currentValue) {
                    if (currentValue.isEmpty) {
                      return 'First name is required';
                    }
                  },
                  onSaved: (currentValue) {
                    userProfile.firstName = currentValue;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (currentValue) {
                    if (currentValue.isEmpty) {
                      return 'Last name is required';
                    }
                  },
                  onSaved: (currentValue) {
                    userProfile.lastName = currentValue;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Loyalty Points'),
                  keyboardType: TextInputType.number,
                  validator: (currentValue) {
                    if (int.parse(currentValue) <= 0) {
                      return 'Loyalty point must be greater than zero';
                    }
                  },
                  onSaved: (currentValue) {
                    userProfile.loyaltyPoints = int.parse(currentValue);
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(hintText: 'Fitness Goal'),
                  onChanged: (newValue) {},
                  items: [
                    ['Lose weight', 1],
                    ['Build muscle', 2],
                    ['Train for a sport', 3],
                    ['Recreation', 4]
                  ].map((item) {
                    return DropdownMenuItem(
                        child: Text(item[0]), value: item[1]);
                  }).toList(),
                  onSaved: (currentValue) {
                    userProfile.fitnessGoal = currentValue;
                  },
                ),
                SwitchListTile(
                  value: userProfile.isActive,
                  onChanged: (newValue) {
                    setState(() {
                      userProfile.isActive = newValue;
                    });
                  },
                  title: Text('Active'),
                ),
                RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      var _message = '';
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        _message = 'to json';
                      } else {
                        _message = 'There was an error in the form';
                      }
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('Generated JSON'),
                              content: Text(_message),
                              actions: [
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    })
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
