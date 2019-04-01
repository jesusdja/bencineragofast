import 'package:bencineragofast/pages/Home/Splash_screen.dart';
import 'package:flutter/material.dart';
import 'pages/app.dart';
import 'package:bencineragofast/pages/Home/intro_screen.dart';

void main() async {
  runApp(MyApp());
}

const PrimaryColor = const Color( 0xff1f520a);

var routes = <String, WidgetBuilder>{
  "/App": (BuildContext context) =>App(),
  "/intro": (BuildContext context) => intro_screen(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //  brightness: Brightness.light,
        primaryColor: PrimaryColor,
        accentColor: PrimaryColor,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w900),

          title: TextStyle(fontSize: 14.0, fontFamily: 'RobotoMono'),
          button: TextStyle(fontSize: 14.0, fontFamily: 'RobotoMono')
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Tasks App',
      home: SplashScreen(),
      routes: routes,
    );
  }
}
