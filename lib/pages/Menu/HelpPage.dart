import 'package:flutter/material.dart';

class Ayuda extends StatefulWidget {
  @override
  _AyudaState createState() => new _AyudaState();
}

class _AyudaState extends State<Ayuda> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Ayuda'),
      ),
    );
  }
}