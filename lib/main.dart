import 'package:flutter/material.dart';
import 'pages/app.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal,
          primaryColor: Colors.teal[800], backgroundColor: Colors.grey[700]
      ),
      debugShowCheckedModeBanner: false,
      title: 'Tasks App',
      home: App(),
    );
  }
}
