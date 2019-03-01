import 'package:flutter/material.dart';
import 'pages/app.dart';

void main() async {
  runApp(MyApp());
}

const PrimaryColor = const Color( 0xff006b29);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: PrimaryColor

      ),
      debugShowCheckedModeBanner: false,
      title: 'Tasks App',
      home: App(),
    );
  }
}
