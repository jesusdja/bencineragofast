import 'package:flutter/material.dart';

class MenuFAB extends StatefulWidget {
  @override
  _MenuFABState createState() => _MenuFABState();
}


class _MenuFABState extends State<MenuFAB> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    return Row (
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            child: Icon(Icons.create_new_folder),
            backgroundColor: Color(0xFF3A3A52),
            elevation: 0.0,
          ),
        ]
    );
  }
}

/*  Container container = new  Column(

          )
      ); */



