import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';
import 'dart:core';

class Vehiculo{
  String NombreMarca = 'Desconocido';
  String NombreModelo = 'Desconocido';
  String NombreYear = 'Desconocido';
  String LitrosCombustible = 'Desconocido';
  //Icono e imagen


  Vehiculo(this.NombreMarca, this.NombreModelo, this.NombreYear, this.LitrosCombustible);

}
class Registrarse extends StatefulWidget {

  @override
  _RegistrarseState createState() => new _RegistrarseState();
}
class _RegistrarseState extends State<Registrarse> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor:PrimaryColor,
        title: new Text('Registrar Vehiculo'),
      ),
      body: MyCustomForm(),
    );
  }
}
class MyCustomForm extends StatefulWidget {


  @override
  MyCustomFormState createState() {
    return MyCustomFormState(vehiculo: <Vehiculo>[]);
  }
}
class MyCustomFormState extends State<MyCustomForm> {
  final List<Vehiculo> vehiculo;
  MyCustomFormState({Key key, @required this.vehiculo,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder (
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container (
            margin: EdgeInsets.only(left: 20, right: 50, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment:  MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text(
                    'Selecione marca',
                    textAlign: TextAlign.justify,
                    //overflow: TextOverflow.ellipsis, ...
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .5,
                  child: FlatButton(
                      child:Text(''),
                      splashColor: Colors.black,
                      padding: const EdgeInsets.all(20.0),
                      textColor: Colors.white,
                      color: PrimaryColor,
                      onPressed: () {
                        MarksDeVheiculo();
                      }
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text(
                    'Seleccione Modelo',
                    textAlign: TextAlign.justify,
                    //overflow: TextOverflow.ellipsis, ...
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .5,
                  child: FlatButton(
                      splashColor: Colors.black,
                      padding: const EdgeInsets.all(25.0),
                      textColor: Colors.white,
                      color: PrimaryColor,
                      onPressed: () {}
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text(
                    'Selecione Año',
                    textAlign: TextAlign.justify,
                    //overflow: TextOverflow.ellipsis, ...
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .5,
                  child: FlatButton(
                      splashColor: Colors.black,
                      padding: const EdgeInsets.all(25.0),
                      textColor: Colors.white,
                      color: PrimaryColor,
                      onPressed: () {}
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Text(
                    'Litros De combustible',
                    textAlign: TextAlign.justify,
                    //overflow: TextOverflow.ellipsis, ...
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .5,
                  child: FlatButton(
                      splashColor: Colors.black,
                      padding: const EdgeInsets.all(25.0),
                      textColor: Colors.white,
                      color: PrimaryColor,
                      onPressed: () {}
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 50.0, right: 0.0, bottom: 40.0),

                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 2.3,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      color: PrimaryColor,

                      elevation: 5.0,
                      textColor: Colors.white,
                      splashColor: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: Center(child: Text('Guardar Vehiculo'))),
                    ),
                  ),
                ),


              ],


            ),


          );
        }


    );
  }

  Future MarksDeVheiculo() async {

    await showDialog(
        context: context,
        child: SimpleDialog(
            title: Text('Marcas de Vehiculo'),
            children: <Widget>[
              Vehiculos(),
            ]
        )
    );
  }


}



class Vehiculos extends StatelessWidget {
  List<Vehiculo> vehiculo;

  var y = 200;
  @override
  Widget build(BuildContext context) {
    var vehiculo;
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: ElementosVehiculos(

        vehiculo: List.generate(
          y,
              (i) => Vehiculo(vehiculo,' ','',''),
        ),
      ),

    );
  }
}


class ElementosVehiculos extends StatefulWidget {


  List<Vehiculo> vehiculo;
  ElementosVehiculos({Key key, @required this.vehiculo,}) : super(key: key);

  @override
  _ElementosVehiculosState createState() => _ElementosVehiculosState();
}


class _ElementosVehiculosState extends State<ElementosVehiculos> {

  String _valueMarca;

  void _setValueMarca(String valueMarca) => setState(() => _valueMarca = valueMarca);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        itemCount: widget.vehiculo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.vehiculo[index].NombreMarca),
            leading: Image.asset('assets/images/icono_gas.png',height: 50),
            onTap: () {
              print(widget.vehiculo[index].NombreMarca);
              // cambiarNombreMarca(widget.marca[index].title);
              _setValueMarca(widget.vehiculo[index].NombreMarca);
              Navigator.pop(context);

              //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
            },
          );
        },
      ),
    );

  }
}//cambiarNombreMarca(String marca){ _NombreMarca = marca;return _NombreMarca;}
