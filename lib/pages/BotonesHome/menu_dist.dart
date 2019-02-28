import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Menu_dist extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  Menu_dist({this.onPressed, this.tooltip, this.icon});

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<Menu_dist> with SingleTickerProviderStateMixin {


  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  String name_gas_button = '95';


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
        backgroundColor: Colors.red[900],
        child: Text(
          text,
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
        backgroundColor: Colors.red[900],
        heroTag: 0,
        onPressed: animate,
        tooltip: 'Toggle',
        child: Text(
        name_gas_button,
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
          child: add(text: '91', tagg: 1),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 2.0,
            0.0,
            0.0,
          ),
          child: add(text: '93',tagg: 2),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            0.0,
            0.0,
          ),
          child: add(text: '95',tagg: 3),
        ),
        toggle(),
      ],
    );
  }

}
