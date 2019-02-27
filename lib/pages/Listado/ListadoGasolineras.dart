import 'package:flutter/material.dart';

class ListadoGasolineras extends StatefulWidget {
  @override
  _ListadoGasolinerasState createState() => new _ListadoGasolinerasState();
}


class _ListadoGasolinerasState extends State<ListadoGasolineras> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Bencineras '),
      ),
    );
  }
}