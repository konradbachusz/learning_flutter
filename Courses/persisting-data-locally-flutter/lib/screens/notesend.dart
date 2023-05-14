import 'package:flutter/material.dart';
import '../models/note.dart';
import '../data/sql_helper.dart';
import '../data/shared_prefs.dart';
import './note.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  int settingColor = 0xff1976d2;
  double fontSize = 16;
  SPSettings settings = SPSettings();
  SqlHelper sqlHelper = SqlHelper();

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
        title: Text('Notes'),
        backgroundColor: Color(settingColor),
      ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (context, snapshot) {
          List<Note> notes =
              snapshot.data == null ? [] : snapshot.data as List<Note>;
          if (notes == null) {
            return Container();
          } else {
            return ReorderableListView(
              onReorder: (oldIndex, newIndex) async {
                final Note note = notes[oldIndex];
                if (oldIndex > newIndex) {
                  await sqlHelper.updatePositions(true, newIndex, oldIndex);
                } else if (oldIndex > newIndex) {
                  newIndex -= 1;
                  await sqlHelper.updatePositions(false, oldIndex, newIndex);
                }
                note.position = newIndex;
                await sqlHelper.updateNote(note);
                setState(() {
                  getNotes();
                });
              },
              children: [
                for (final note in notes)
                  Dismissible(
                      key: Key(note.id.toString()),
                      onDismissed: (direction) {
                        sqlHelper.deleteNote(note);
                      },
                      child: Card(
                        key: ValueKey(note.position),
                        child: ListTile(
                          title: Text(note.name),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NoteScreen(note, false)));
                          },
                        ),
                      ))
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(settingColor),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NoteScreen(Note('', '', '', 1), true)));
          }),
    );
  }

  Future<List<Note>> getNotes() async {
    List<Note> notes = await sqlHelper.getNotes();
    return notes;
  }
}
