import 'package:flutter/material.dart';

class RadialTransition extends StatelessWidget {
  
  RadialTransition({required this.maxRadius, required this.child});

  final double maxRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: Container(
          width: maxRadius,
          height: maxRadius,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}