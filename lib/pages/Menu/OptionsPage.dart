import 'package:flutter/material.dart';

class opciones extends StatefulWidget {
  @override
  _opcionesState createState() => new _opcionesState();
}


class _opcionesState extends State<opciones> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Opciones '),

      ),

    );
  }
}