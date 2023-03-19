import 'package:flutter/material.dart';

void main() => runApp(OrangeContainer());

class OrangeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Row(
          children: [
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://openclipart.org/image/300px/svg_to_png/176055/044482e2.png')),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.brown,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://openclipart.org/image/800px/206013')),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://openclipart.org/image/800px/179198')),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://openclipart.org/image/800px/130843')),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://openclipart.org/image/800px/21054')),
              ),
            )
          ],
        ));
  }
}
