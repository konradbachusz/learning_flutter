import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SPSettings {
  static SPSettings _instance;
  final String fontSizeKey = 'font_size';
  final String colorKey = 'color';
  static SharedPreferences _sp;

  factory SPSettings() {
    if (_instance == null) {
      _instance = SPSettings._internal();
    }
    return _instance;
  }
  SPSettings._internal();
  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future setColor(int color) {
    return _sp.setInt(colorKey, color);
  }

  int getColor() {
    int color = _sp.getInt(colorKey);
    if (color == null) {
      return 0xff1976D2; //blue
    } else {
      return color;
    }
  }

  Future setFontSize(double size) {
    return _sp.setDouble(fontSizeKey, size);
  }

  double getFontSize() {
    double fontSize = _sp.getDouble(fontSizeKey);
    if (fontSize == null) {
      fontSize = 14;
    }
    return fontSize;
  }

 


}
