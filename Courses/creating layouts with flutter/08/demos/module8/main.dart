import 'package:flutter/material.dart';
import './details.dart';
import 'util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HeroPage(),
    );
  }
}

class HeroPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final double maxRadius = MediaQuery.of(context).size.width * 0.4;
    final double minRadius = 80.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation Demo"),
      ),
      body:   Container(
        padding: EdgeInsets.all(24),
        alignment: Alignment.topLeft,
        child: Row(children: <Widget>[
          GestureDetector(
              child: Util.buildHeroRadialIcon(Util.COFFEE_URL, 'coffee', minRadius, maxRadius),
              onTap: () {changeRoute(context, Drinks.coffee);},
              ),
          GestureDetector(
            child: Util.buildHeroRadialIcon(Util.CAPPUCCINO_URL, 'cappuccino',minRadius, maxRadius),
             onTap: () {changeRoute(context, Drinks.cappuccino);},
            ),
          GestureDetector(
            child: Util.buildHeroRadialIcon(Util.TEA_URL, 'tea', minRadius, maxRadius),
             onTap: () {changeRoute(context, Drinks.tea);},
            ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,),
      ),
    );
  }

  void changeRoute(BuildContext context, Drinks drink) {
    switch (drink) {
      case Drinks.coffee:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(Util.COFFEE_URL, 'coffee')));
        break;
      case Drinks.cappuccino:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(Util.CAPPUCCINO_URL, 'cappuccino')));
        break;
      case Drinks.tea:
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(Util.TEA_URL, 'tea')));
        break;
    }

  }

}