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

  double getFontSize() {
    return _sp.getDouble(fontSizeKey);
  }

  Future setFontSize(double size) {
    return _sp.setDouble(fontSizeKey, size);
  }

  int getColor() {
    int color = _sp.getInt(colorKey);
    if (color == null) {
      return 0xff1976D2; //blue
    } else {
      return color;
    }
  }

  Future setColor(int color) {
    return _sp.setInt(colorKey, color);
  }
}
