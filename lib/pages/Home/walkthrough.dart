import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imagecolor;

  Walkthrough(
      {this.title,
      this.content,
      this.imageIcon,
      this.imagecolor = Colors.redAccent});

  @override
  WalkthroughState createState() {
    return WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(20.0),
      child: Material(
        color: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Transform(
              transform:
                  new Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: new Text(
                widget.title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            new Transform(
              transform:
                  new Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: new Text(widget.content,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.black)),
            ),
            ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Image.asset(
                widget.imageIcon,
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                  fit: BoxFit.fill,
              ),
            )
            ,
          ],
        ),
      ),
    );
  }
}
