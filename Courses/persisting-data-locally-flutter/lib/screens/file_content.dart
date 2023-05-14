import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/file_helper.dart';
import '../data/shared_prefs.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'files.dart';
import 'package:share/share.dart';

class FileScreen extends StatefulWidget {
  final File? file;
  FileScreen(this.file);

  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  int settingColor = 0xff1976D2;
  double fontSize = 16;
  SPSettings settings  = SPSettings();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  FileHelper helper = FileHelper();
  @override
  void initState() {
    settings.init().then((_) {
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
        title: TextField(
          controller: titleController,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
        backgroundColor: Color(settingColor),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Expanded(
            child: TextField(
              maxLines: null,
              expands: true,
              controller: contentController,
              style: TextStyle(fontSize: fontSize),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        backgroundColor: Color(settingColor),
        onPressed: () {
          
           Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => FilesScreen()));
        },
      ),
    );
  }
}