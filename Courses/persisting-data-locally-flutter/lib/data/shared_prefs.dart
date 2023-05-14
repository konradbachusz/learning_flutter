import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../data/shared_prefs.dart';

class SPSettings {
  final String fontSizeKey = 'font_size';
  final String colorKey = 'color';

  static late SharedPreferences _sp;


  static SPSettings? _instance;


  SPSettings._internal();

  factory SPSettings() {
    _instance ??= SPSettings._internal();
    return _instance as SPSettings;  

  }

  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future setColor(int color) {
    return _sp.setInt(colorKey, color);
  }

  int getColor() {
    int? color = _sp.getInt(colorKey);
    if (color == null) {
      color = 0xff1976d2;
    }
    return color;
  }

  Future setFontSize(double size) {
    return _sp.setDouble(fontSizeKey, size);
  }

  double getFontSize() {
    double? fontSize = _sp.getDouble(fontSizeKey);
    if (fontSize == null) {
      fontSize = 14;
    }
    return fontSize;
  }
}
