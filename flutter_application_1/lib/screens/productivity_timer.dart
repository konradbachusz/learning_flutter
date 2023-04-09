import 'package:flutter/material.dart';

void main() => runApp(ProductivityTimerScreen());

class ProductivityTimerScreen extends StatelessWidget {
  var red_color = Color.fromARGB(255, 226, 33, 33);
  var light_green_color = Color.fromARGB(255, 99, 181, 79);
  var dark_green_color = Color.fromARGB(255, 53, 104, 40);
  var button_box_radius = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Productivity Timer', style: TextStyle(color: (Colors.white))),
        backgroundColor: red_color,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 140,
                  height: 40,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: red_color,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Work',
                          style: TextStyle(color: (Colors.white))),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: light_green_color,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Short Break',
                          style: TextStyle(color: (Colors.white))),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: dark_green_color,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text('Long Break',
                          style: TextStyle(color: (Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.all(150),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 180,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('25:00',
                          style:
                              TextStyle(fontSize: 60, color: (Colors.grey)))),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
