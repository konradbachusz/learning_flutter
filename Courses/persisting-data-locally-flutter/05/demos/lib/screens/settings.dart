import 'package:flutter/material.dart';
import '../data/shared_prefs.dart';
import '../models/font_size.dart'; 

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int settingColor = 0xff1976D2;
  double fontSize = 16; //14 is the default
  SPSettings settings;
  final List<int> colors = [
    0xFF455A64,
    0xFFFFC107,
    0xFF673AB7,
    0xFFF57C00,
    0xFF795548
  ];

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
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(settingColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text( 
            'Choose a Font Size for the App', 
            style: TextStyle( 
              fontSize: fontSize, 
              color: Color(settingColor)
              ), 
          ), 
          DropdownButton( 
            value: fontSize.toString(), 
            items: getDropDownMenuItems(), 
            onChanged: changeSize, 
          ), 
          Text('App Main Color',
            style: TextStyle( 
              fontSize: fontSize, 
              color: Color(settingColor)
              ), 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () => setColor(colors[0]),
                  child: ColorButton(colors[0])),
              GestureDetector(
                  onTap: () => setColor(colors[1]),
                  child: ColorButton(colors[1])),
              GestureDetector(
                  onTap: () => setColor(colors[2]),
                  child: ColorButton(colors[2])),
              GestureDetector(
                  onTap: () => setColor(colors[3]),
                  child: ColorButton(colors[3])),
              GestureDetector(
                  onTap: () => setColor(colors[4]),
                  child: ColorButton(colors[4])),
            ],
          )
        ],
      ),
    );
  }

void changeSize(String newSize) { 

       settings.setFontSize(double.tryParse(newSize)); 

    setState(() { 

      //fontSizeString = newSize; 

      fontSize = double.tryParse(newSize); 

    }); 

  } 
  setColor(int color) {
    setState(() {
      settingColor = color;
    });
    settings.setColor(color);
  }
   List<DropdownMenuItem<String>> getDropDownMenuItems() { 
    List<DropdownMenuItem<String>> items = new List(); 
    for (FontSize fontSize in fontSizes) { 
      items.add(DropdownMenuItem( 
          value: fontSize.size.toString(), child: new Text(fontSize.name, ))); 
    } 
    return items; 
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
