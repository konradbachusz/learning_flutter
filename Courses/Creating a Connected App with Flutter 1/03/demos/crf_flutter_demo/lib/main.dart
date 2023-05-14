import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:io';
import 'dart:convert';

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
  int _selected = 1;
  String _contents = '';
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
            Text(
              'Select a client',
            ),
            DropdownButton(
              value: _selected,
              items: [
                ['Adam Adams', 1],
                ['Bill Williams', 2],
                ['Carrie Carlson', 3],
                ['Tina Thomas', 4]
              ].map((client) {
                return DropdownMenuItem(
                  child: Text(client[0]),
                  value: client[1],
                );
              }).toList(),
              onChanged: (value) async {
                var program_details =
                    await http.read('http://10.0.2.2:5000/program/$value');
                setState(() {
                  _contents = program_details;
                  _selected = value;
                });
              },
            ),
            Text('$_contents'),
            RaisedButton(
              child: Text('Bogus endpoint'),
              onPressed: () async {
                var response = await http.get('http://10.0.2.2:5000/bogus');
                setState(() {
                  if (response.statusCode == 404) {
                    _contents = 'No endpoint was available';
                  }
                });
              },
            ),
            RaisedButton(
              child: Text('Server error'),
              onPressed: () async {
                var httpClient = HttpClient();
                var request = await httpClient
                    .getUrl(Uri.parse('http://10.0.2.2:5000/fiveohoh'));
                var response = await request.close();
                var decoded = response.transform(utf8.decoder);
                setState(() {
                  if (response.statusCode == 500) {
                    _contents = 'Server error';
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
