import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 5: Create card box with ratings',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Product Listing")),
        body: ListView(
          shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const <Widget> [
            ProductBox(name: "iPhone", description: "iPhone is the stylist phone ever", price: 1000, image: "iphone.png"),
            ProductBox(name: "Pixel", description: "Pixel is the most featureful phone ever", price: 800, image: "pixel.png"),
            ProductBox(name: "Laptop", description: "Laptop is most productive development tool", price: 2000, image: "laptop.png"),
            ProductBox(name: "Tablet", description: "Tablet is the most useful device ever for meeting", price: 1500, image: "tablet.png"),
            ProductBox(name: "Pendrive", description: "Pendrive is useful storage medium", price: 100, image: "pendrive.png"),
            ProductBox(name: "Floppy Drive", description: "Floppy Drive is useful rescue storage medium", price: 20, image: "floppydisk.png")
          ],
        )
    );
  }
}

class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }
  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }
  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1 ? Icon(Icons.star, size: _size) : Icon(Icons.star_border, size: _size)),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: _size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 2 ? Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size,)),
            color: Colors.red[500],
            onPressed: _setRatingAsTwo,
            iconSize: _size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 3 ? Icon(Icons.star, size: _size,) :
            Icon(Icons.star_border, size: _size,)),
            color: Colors.red[500],
            onPressed: _setRatingAsThree,
            iconSize: _size,
          ),
        )
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.name, required this.description, required this.price, required this.image}) : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2), height: 140, child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Image.asset("assets/" + image), Expanded(
            child: Container(
              padding: const EdgeInsets.all(5), child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(description),
                Text("Price: " + price.toString()),
                const RatingBox()
              ],
            ),
            )
        )
      ],
      ),
    ),
    );
  }
}