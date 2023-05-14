import 'package:flutter/material.dart';
import 'package:hello_flutter/shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Globo Fitness')),
        drawer: MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/beach.jpg'),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
            ),
            child:
                Text('Commit to be fit, dare to be great \nwith Globo Fitness',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.grey,
                        )
                      ],
                    )),
          )),
        ));
  }
}

class HelloYou extends StatefulWidget {
  const HelloYou({Key? key}) : super(key: key);

  @override
  _HelloYouState createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  @override
  Widget build(BuildContext context) {
    
    return Container();
  }
}
