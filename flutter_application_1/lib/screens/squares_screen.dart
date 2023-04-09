import 'package:flutter/material.dart';

void main() => runApp(SquaresScreen());

class SquaresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rows and Columns'),
      ),
      backgroundColor: Colors.indigo[100],
      body: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return Container(
      width: sizeX,
      height: sizeY,
      child: Column(
        children: [
          Row(
            verticalDirection: VerticalDirection.down,
            // textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: createSquares(5),
          ),
          Row(
              verticalDirection: VerticalDirection.down,
              // textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Container(width: 60, height: 60)]),
          Row(
            verticalDirection: VerticalDirection.down,
            // textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: createSquares(5),
          ),
        ],
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    List<Widget> squares = [];
    while (i < numSquares) {
      Container square = Container(
          // flex: i,
          child: Container(
              color: colors[i],
              width: 60,
              height: 60,
              child: Text(i.toString())));
      i++;
      squares.add(square);
    }
    return squares;
  }
}
