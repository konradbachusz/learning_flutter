import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import '../data/file_helper.dart';
import '../data/shared_prefs.dart';
import 'file_content.dart';

class FilesScreen extends StatefulWidget {
  @override
  _FilesScreenState createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  int settingColor = 0xff1976d2;
  double fontSize = 16;
  SPSettings settings = SPSettings();
  FileHelper helper = FileHelper();
  List<File> files = [];

  @override
  void initState() {
    settings.init().then((value) {
      setState(() {
        settingColor = settings.getColor();
        fontSize = settings.getFontSize();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Posts'),
        backgroundColor: Color(settingColor),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(settingColor),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FileScreen(null)));
          }),
      body: FutureBuilder(
        future: helper.getFiles(),
        builder: (context, snapshot) {
          files = (snapshot.data == null) ? [] : snapshot.data as List<File>;
          return ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(files[index].toString()),
                onDismissed: (direction) {
                  helper.deleteFile(files[index]);
                },
                child: ListTile(
                  title: Text(basename(files[index].path)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FileScreen(files[index])));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
