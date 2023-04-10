import 'package:flutter/material.dart';
import 'dart:async';

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  child: Align(alignment: Alignment.center, child: OtpTimer()),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
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
                      child: const Text('Stop',
                          style: TextStyle(color: (Colors.white))),
                    ),
                  ),
                ),
                Container(
                  width: 200,
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
                      child: const Text('Restart',
                          style: TextStyle(color: (Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 400,
              height: 200,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4d87b0f4-ae26-4b18-835c-af3a7ce1349f/ddab0ew-016e40bb-5aff-4239-b27b-e07e9803ca20.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzRkODdiMGY0LWFlMjYtNGIxOC04MzVjLWFmM2E3Y2UxMzQ5ZlwvZGRhYjBldy0wMTZlNDBiYi01YWZmLTQyMzktYjI3Yi1lMDdlOTgwM2NhMjAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.-CIz4lxAK4BBdzM2O0ZjzxOZWii0GhnRFSCzM6DANAE')),
              ),
            )
          ],
        ),
      )),
    );
  }
}

//Actual timer

class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 1500;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timerText,
        style: TextStyle(fontSize: 60, color: (Colors.grey)));
  }
}
