import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'exercise.dart';

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

class ProgramDetails extends StatelessWidget {
  final List exercises;

  ProgramDetails({Key key, @required this.exercises}) : super(key: key);


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carved Rock Fitness'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${exercises[index].title} - ${exercises[index].reps.toString()}'),
            );
          },
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var _globalKey = GlobalKey<FormState>();
  var _username = '';
  var _password = '';

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
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Username'),
                    onSaved: (newValue) {
                      _username = newValue;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    onSaved: (newValue) {
                      _password = newValue;
                    }
                  ),
                ],
              )
            ),
            RaisedButton(
              onPressed: () async {
                _globalKey.currentState.save();
                var credentials = '$_username:$_password';
                var bytes = utf8.encode(credentials);
                var b64 = base64.encode(bytes);

                var httpClient = HttpClient();
                var request = await httpClient.get('127.0.0.1', 5000, '/program');
                request.headers.add(HttpHeaders.authorizationHeader, 'Basic $b64');

                var response = await request.close();

                var stringBuffer = StringBuffer();

                if (response.statusCode == 401 || response.statusCode == 403) {
                  showDialog(context: context,
                  builder: (_) {
                    return AlertDialog(content: Text('Unauthorized or not allowed'),
                    title: Text('Error'),
                    actions: [
                      FlatButton(child: Text('OK'), onPressed: () {
                        Navigator.of(context).pop();
                      },)
                    ]);
                  });
                } else {
                  response.transform(utf8.decoder).listen((chunk) {
                    stringBuffer.write(chunk);
                  }, onDone: () {
                    var exercises = jsonDecode(stringBuffer.toString()) as List;
                    exercises = exercises.map((exercise) => Exercise.fromJson(exercise)).toList();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProgramDetails(exercises: exercises,)));
                  });
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
