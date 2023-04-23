import 'package:flutter/material.dart';
import 'util.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Details extends StatelessWidget {
  final String drinkPath;
  final String drinkTag;
  //<radial>
  static const minRadius = 40;
  double maxRadius = 0;
  //</radial>
  Details(this.drinkPath, this.drinkTag);
  @override
  Widget build(BuildContext context) {
    timeDilation = 10;
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.6;

    //<radial>
    maxRadius = width / 2;
    pop() {
      Navigator.of(context).pop();
    }
   return Scaffold(
      appBar: AppBar(title: Text('Hero Animation'),),
      body:Center(
       child: Util.buildHeroRadialDestination(drinkPath, drinkTag, width, height, pop)
    ));      
  }
}