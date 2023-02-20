import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontSize = 18;
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  String heightMessage = '';
  String weightMessage = '';
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'pounds');

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ToggleButtons(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: fontSize),
                    )),
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: heightMessage,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: weightMessage),
              ),
            ),
            ElevatedButton(
                onPressed: findBMI,
                child: Text('Calculate BMI',
                    style: TextStyle(
                      fontSize: fontSize,
                    ))),
            ElevatedButton(
                onPressed: reset,
                child: Text('Reset',
                    style: TextStyle(
                      fontSize: fontSize,
                    ))),
            Text(result,
                style: TextStyle(
                  fontSize: fontSize,
                ))
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    //pounds * 703 / inches * inches
    //kg / m2
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = (weight * 703) / (height * height);
    }
    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }

  void reset() {
    setState(() {
      result = '';
    });
  }
}
