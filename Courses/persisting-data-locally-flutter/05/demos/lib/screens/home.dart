import 'package:flutter/material.dart';
import 'package:globeapp/screens/notes.dart';
import '../data/shared_prefs.dart';
import '../screens/passwords.dart';
import '../screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int settingColor = 0xff1976d2;
  double fontSize = 16;
  SPSettings settings;
  @override
  void initState() {
    settings = SPSettings();
    getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSettings(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(settingColor),
            title: Text('GlobApp'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('GlobApp Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      )),
                  decoration: BoxDecoration(
                    color: Color(settingColor),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Passwords',
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordsScreen()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotesScreen()));
                  },
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/travel.jpg'), fit: BoxFit.cover)),
          ),
        );
      },
    );
  }

  Future getSettings() async {
    settings = SPSettings();
    settings.init().then((value) {
      setState(() {
        settingColor = settings.getColor();
        fontSize = settings.getFontSize();
      });
    });
  }
}