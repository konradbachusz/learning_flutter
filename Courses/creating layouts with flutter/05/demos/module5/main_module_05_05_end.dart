import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
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
      child: Container(
          child: ListView(
            children: showContacts(),)),
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
    squares.add(Container(
      color: Colors.black,
    ));
    while (i < numSquares) {
      Positioned square = Positioned(
          top: 100 + i.toDouble() * 100,
          left: 25 + i.toDouble() * 25,
          child: Container(
              color: colors[i % 5],
              height: 100.0,
              width: 100.0,
              child: Text(i.toString())));
      i++;

      squares.add(square);
    }
    return squares;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    Container square = Container(
        color: colors[position % 5],
        height: 100.0,
        width: 100.0,
        child: Text(position.toString()));

    return square;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = [];
    Container backGround = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('http://bit.ly/pizzaimage'),
              fit: BoxFit.fitHeight)),
    );
    layoutChildren.add(backGround);
    Positioned pizzaCard = Positioned(
        top: sizeY / 20,
        left: sizeX / 20,
        child: Card(
          elevation: 20,
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                'Pizza Margherita',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[800],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'This delicious Pizza is mafe of Tomato,\n Mozzarella and Basil.\n\n Seriously, you can\'t miss it!',
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              )
            ],
          ),
        ));
    layoutChildren.add(pizzaCard);
    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            primary: Colors.orange[900]),
        child: Text(
          'Order Now!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
    layoutChildren.add(buttonOrder);
    return layoutChildren;
  }

  Widget createSeparator(int position) {
    Widget separator = Container(
      height: 15,
      color: Colors.black,
    );
    return separator;
  }

  List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts
        .add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
    contacts.add(
        Contact('Frank Slade', 'Scent of a woman', Icons.sentiment_satisfied));
    contacts.add(Contact(
        'Mildred Hayes',
        'Three Billboards outside Ebbing, NMissouri',
        Icons.sentiment_dissatisfied));
    contacts.add(
        Contact('Bruce Wayne', 'The Dark Knight', Icons.sentiment_neutral));
    contacts.add(
        Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_neutral));
    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContacts();
    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }
    List<ListTile> list = [];
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subTitle),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.amber[600],
          ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      ));
    });
    return list;
  }
}

class Contact {
  String name;
  String subTitle;
  IconData icon;

  Contact(this.name, this.subTitle, this.icon);
}
