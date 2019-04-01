import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var db ;

  @override
  void initState() {

    db = new DatabaseHelper();
    VerificarBsadeDato();
    // TODO: implement initState
    super.initState();
    /*int x = 9;
    if(x != 9){
      Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, "/App"));
    }else{
      Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, "/App"));
    }*/

  }

  VerificarBsadeDato() async {

    if(await db.queryRowCount() != 0){
      print("ya esta registrado el Usuario");
      Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, "/App"));

    }else{
      print("registro Exitoso de Usuario");
      Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, "/intro"));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color( 0xff1f520a)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80.0,
                        child: Icon(
                          Icons.local_gas_station,
                          color: Colors.black,
                          size: 80.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Bencinera GoFast',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'Bienvenido',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}