import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' hide Column;
import './posts.dart';
import '../data/shared_prefs.dart';
import '../data/moor_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatefulWidget {
  final BlogPost post;
  final isNew;

  PostDetailScreen(this.post, this.isNew);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  int settingColor = 0xff1976d2;
  double fontSize = 16;
  SPSettings settings = SPSettings();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtContent = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  @override
  void initState() {
    settings = SPSettings();
    settings.init().then((value) {
      setState(() {
        settingColor = settings.getColor();
        fontSize = settings.getFontSize();
      });
    });
    txtName.text = widget.post.name;
    txtContent.text = widget.post.content ?? '';
    String postDate =
        (widget.post.date != null) ? formatter.format(widget.post.date!) : '';
    txtDate.text = postDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlogDb blogDb = Provider.of<BlogDb>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog View'),
        backgroundColor: Color(settingColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlogText('Name', txtName, fontSize, 1),
            BlogText('Content', txtContent, fontSize, 5),
            BlogText('Date', txtDate, fontSize, 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          backgroundColor: Color(settingColor),
          onPressed: () {
            if (widget.isNew) {
              BlogPostsCompanion newPost = BlogPostsCompanion(
                name: Value(txtName.text),
                content: Value(txtContent.text),
                date: (txtDate.text != '')
                    ? Value(formatter.parse(txtDate.text))
                    : Value(null),
              );
              blogDb.insertPost(newPost);
            } else {
              BlogPost updatedPost = BlogPost(
                  id: widget.post.id,
                  name: (txtName.text),
                  content: (txtContent.text),
                  date: formatter.parse(txtDate.text));
              blogDb.updatePost(updatedPost);
            }
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PostsScreen()));
          }),
    );
  }
}

class BlogText extends StatelessWidget {
  final String description;
  final TextEditingController controller;
  final double textSize;
  final int numLines;

  BlogText(this.description, this.controller, this.textSize, this.numLines);

  @override
  Widget build(BuildContext context) {
    TextInputType textInputType;

    if (numLines > 1) {
      textInputType = TextInputType.multiline;
    } else if (this.description == 'Date') {
      textInputType = TextInputType.datetime;
    } else {
      textInputType = TextInputType.text;
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        maxLines: numLines,
        style: TextStyle(
          fontSize: textSize,
        ),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: description),
      ),
    );
  }
}
