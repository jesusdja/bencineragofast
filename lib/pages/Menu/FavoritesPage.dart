import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';
class favoritos extends StatefulWidget {
  @override
  _favoritosState createState() => new _favoritosState();
}

class _favoritosState extends State<favoritos> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: PrimaryColor,
        title: new Text('Favoritos'),
      ),
    );
  }
}