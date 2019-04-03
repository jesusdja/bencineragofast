
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
      color: Color(0xff1f520a),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 12,
            child: PageView(
              children: <Widget>[
                /*Container(

                ),*/
                Walkthrough(
                  title: 'Vista principal',
                  content: 'Localice las bencineras cercanas a usted.',
                  imageIcon: 'assets/images/ayuda1.png',
                ),
                Walkthrough(
                  title: 'Rutas optimas',
                  content: 'Visualice la ruta mas eficiente.',
                  imageIcon: 'assets/images/ayuda2.png',
                ),
                Walkthrough(
                  title: 'Registar Vehiculo propio',
                  content: 'Facilitando busquedas y obteniendo mejores beneficion',
                  imageIcon: 'assets/images/ayuda3.png',
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                  lastPage ? null : Navigator.pushReplacementNamed(context, "/App"),
                ),
                FlatButton(
                  child: Text(lastPage ? "Finalizar" : "Siguiente",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? Navigator.pushReplacementNamed(context, "/App")
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
