import 'package:flutter/material.dart';

class opciones extends StatefulWidget {
  @override
  _opcionesState createState() => new _opcionesState();
}

enum Answers{YES,NO,MAYBE}

class _opcionesState extends State<opciones> {
  String _value = '';
  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async { //cambiar Nombre para funcion de ventan emerrgente
    switch(
    await showDialog(
        context: context,
        /*it shows a popup with few options which you can select, for option we
        created enums which we can use with switch statement, in this first switch
        will wait for the user to select the option which it can use with switch cases*/
        child: new SimpleDialog(
          title: new Text('Do you like Flutter?'),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Yes!!!'),onPressed: (){Navigator.pop(context, Answers.YES);},),
            new SimpleDialogOption(child: new Text('NO :('),onPressed: (){Navigator.pop(context, Answers.NO);},),
            new SimpleDialogOption(child: new Text('Maybe :|'),onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
          ],
        )
    )
    ) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('No');
        break;
      case Answers.MAYBE:
        _setValue('Maybe');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Opciones '),


      ),

      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
          children: <Widget>[
            Text(
              'Tipo de Mapa',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),

            ),

            new SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: new RaisedButton(
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: Colors.teal[500],
                onPressed: _askUser,
                child: new Text("Seleccionar Mapa"),


            ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              'Marca Favorita',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),

            ),

            new SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: new RaisedButton(
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: Colors.teal[500],
                onPressed: _askUser,
                child: new Text("Todas"),

              ),
            ),
            Divider(
              height: 20,
            ),

            Text(
              'Precio ',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),

            ),

      ],

    ),

    ),
    );
  }
}