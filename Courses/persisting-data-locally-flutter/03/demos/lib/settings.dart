import 'package:flutter/material.dart';
import './data/sharedprefs.dart';
import './data/font_size.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  int settingColor = 0xff1976D2;
  double fontSize = 16; //14 is the default

  SPSettings settings;
  final List<FontSize> fontSizes = [
    FontSize('Small', 12),
    FontSize('Medium', 16),
    FontSize('Large', 20),
    FontSize('Extra-Large', 24),
  ];

  @override
  void initState() {
    settings = SPSettings();
    settings.init().then((_) {
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
        title: Text('App Settings'),
        backgroundColor: Color(settingColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Choose a Font Size for the App',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: fontSize
              ),
          ),
          DropdownButton(
            value: fontSize.toString(),
            items: getDropDownMenuItems(),
            onChanged: changeSize,
          ),
          Text(
            'App main color', 
            style: TextStyle(fontSize: fontSize, color: Color(settingColor)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () => setColor(0xFF455A64),
                  child: ColorButton(0xFF455A64)),
              GestureDetector(
                  onTap: () => setColor(0xFFFFC107),
                  child: ColorButton(0xFFFFC107)),
              GestureDetector(
                  onTap: () => setColor(0xFF673AB7),
                  child: ColorButton(0xFF673AB7)),
              GestureDetector(
                  onTap: () => setColor(0xFFF57C00),
                  child: ColorButton(0xFFF57C00)),
              GestureDetector(
                  onTap: () => setColor(0xFF795548),
                  child: ColorButton(0xFF795548)),
            ],
          )
        ],
      ),
    );
  }

  setColor(int color) {
    setState(() {
      settingColor = color;
    });
    settings.setColor(color).then((value) => print(value.toString()));
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (FontSize fontSize in fontSizes) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
          value: fontSize.size.toString(), child: new Text(fontSize.name, style: TextStyle( fontFamily: 'Raleway'))));
    }
    return items;
  }

  void changeSize(String newSize) {
    // List<FontSize> filteredFS =
    //     fontSizes.where((element) => element.size == double.tryParse(newSize)).toList();
    settings.setFontSize(double.tryParse(newSize));
    setState(() {
      //fontSizeString = newSize;
      fontSize = double.tryParse(newSize);
    });
  }
}

class ColorButton extends StatelessWidget {
  final int colorCode;
  ColorButton(this.colorCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(colorCode),
      ),
    );
  }
}
