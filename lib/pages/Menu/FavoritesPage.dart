import 'package:flutter/material.dart';

class favoritos extends StatefulWidget {
  @override
  _favoritosState createState() => new _favoritosState();
}

class _favoritosState extends State<favoritos> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Favoritos'),
      ),
    );
  }
}