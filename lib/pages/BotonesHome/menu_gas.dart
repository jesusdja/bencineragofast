import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Menu_gas extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  Menu_gas({this.onPressed, this.tooltip, this.icon});

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<Menu_gas> with SingleTickerProviderStateMixin {


  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  String name_gas_button = '50';


  @override
  initState() {

    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);



    _buttonColor = ColorTween(
      begin: Colors.red,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {

    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add({String text, int tagg}) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){animate(); name_gas_button = text;},
        tooltip: 'Add',
        heroTag: tagg,
        backgroundColor: Color.fromRGBO(222,37,37,10),
        child: Text(
          text + 'Km',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
          ),
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(222,37,37,10),
        onPressed: animate,
        heroTag: 4,
        tooltip: 'Toggle',
        child: Text(
        name_gas_button + 'Km',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {




    return Row (
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 3.0,
            0.0,
            0.0,
          ),
          child: add(text: '5',tagg: 5),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 2.0,
            0.0,
            0.0,
          ),
          child: add(text: '20',tagg: 6),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            0.0,
            0.0,
          ),
          child: add(text: '50', tagg: 7),
        ),
        toggle(),
      ],
    );
  }

}
