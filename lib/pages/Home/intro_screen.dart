
import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Home/walkthrough.dart';

class intro_screen extends StatefulWidget {
  @override
  intro_screenState createState() {
    return intro_screenState();
  }
}

class intro_screenState extends State<intro_screen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 8,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: 'hola 1',
                  content: 'Contenido 1',
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: 'hola 2',
                  content: 'Contenido 2',
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: 'hola 3',
                  content: 'Contenido 3',
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: 'hola 4',
                  content: 'Contenido 4',
                  imageIcon: Icons.verified_user,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : "Omitir",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                  lastPage ? null : Navigator.pushNamed(context, "/App"),
                ),
                FlatButton(
                  child: Text(lastPage ? "Finalizar" : "Siguiente",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? Navigator.pushNamed(context, "/App")
                      : controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
