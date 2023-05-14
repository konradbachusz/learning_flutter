import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Container'),
          ),
          body: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(50),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.rectangle,
                    image: DecorationImage(image: NetworkImage('http://bit.ly/flutter_tiger')),
              ),)
            ],
          )),
    );
  }
}
