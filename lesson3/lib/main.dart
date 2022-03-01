import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 3: Create card box',
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
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Hello World')),
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
      padding: const EdgeInsets.all(2), height: 120, child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            Image.asset("assets/appimages/" + image), Expanded(
              child: Container(
                padding: const EdgeInsets.all(5), child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(description),
                    Text("Price: " + price.toString())
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