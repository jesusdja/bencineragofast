
import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Home/mapaHome.dart';


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Stack(
        children: <Widget>[
          mapaHomePage(),
        ]
      )
    );
  }
}