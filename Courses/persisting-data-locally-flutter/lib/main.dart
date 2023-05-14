import 'package:flutter/material.dart';
import 'package:flutter_data_update_2021/data/moor_db.dart';
import 'package:flutter_data_update_2021/screens/home.dart';
import 'package:provider/provider.dart';
import './screens/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => BlogDb(),
      child: MaterialApp(
        title: 'Globapp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
