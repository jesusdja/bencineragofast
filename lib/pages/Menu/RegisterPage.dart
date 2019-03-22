import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';
import 'dart:core';
import 'package:bencineragofast/pages/sqlflite/vehiculo.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';


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

  DatabaseHelper db = new DatabaseHelper();

  final List<Vehiculo> vehiculo;
  MyCustomFormState({Key key, @required this.vehiculo,});

  String _valueMarca = 'Desconocido';
  String _valueModel = 'Desconocido';

   _ElementosMarca({List<Vehiculo> vehiculo}) {
     return Container(
        child: ListView.builder(
          itemCount: vehiculo.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(vehiculo[index].marcaVehiculo),
              leading: Image.asset('assets/images/icono_gas.png',height: 50),
              onTap: () {
                setState(() {
                  _valueMarca = vehiculo[index].marcaVehiculo;

                  //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
                });
                print(_valueMarca);
                Vehiculo vehiculoUp = null;
                vehiculoUp = new Vehiculo(1, vehiculo[index].marcaVehiculo,
                    vehiculo[index].modeloVehiculo ,
                    vehiculo[index].yearsVehiculo,
                    vehiculo[index].combustible);
                db.updateCarro(vehiculoUp);
                Navigator.pop(context);
              },
            );
          },
        ),
      );
  }
    Marca() {
  var y = 20;
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: _ElementosMarca (
        vehiculo: List.generate(
          y, (i) => Vehiculo(1,'Marca $i',' ','',''),
        ),
      ),
    );
}

  _ElementosModel({List<Vehiculo> vehiculo}) {
    return Container(
      child: ListView.builder(
        itemCount: vehiculo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehiculo[index].modeloVehiculo),
            leading: Image.asset('assets/images/icono_gas.png',height: 50),

          );
        },
      ),
    );
  }
  Model() {
    var y = 20;
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: _ElementosModel (
        vehiculo: List.generate(
          y, (i) => Vehiculo(1,'Model $i',' ','',''),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder (
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container (
            margin: EdgeInsets.only(left: 20, right: 50, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
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
                                child:Text(_valueMarca),//Valor a cambiar
                                splashColor: Colors.black,
                                padding: const EdgeInsets.all(20.0),
                                textColor: Colors.white,
                                color: PrimaryColor,
                                onPressed: () {
                                  MarksDeVheiculo();
                                }
                            ),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                //--------------------------------First Mark

                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                  child: Text(_valueModel),
                                  splashColor: Colors.black,
                                  padding: const EdgeInsets.all(25.0),
                                  textColor: Colors.white,
                                  color: PrimaryColor,
                                  onPressed: () {ModelDeVheiculo;}
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //--------------------------------Second Model

               Container(
                 child: Row(
                   children: <Widget>[
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
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
                                 child: Text(''),
                                 splashColor: Colors.black,
                                 padding: const EdgeInsets.all(25.0),
                                 textColor: Colors.white,
                                 color: PrimaryColor,
                                 onPressed: () {}
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
                //-------------------------------3 --years


                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                  child: Text(''),
                                  splashColor: Colors.black,
                                  padding: const EdgeInsets.all(25.0),
                                  textColor: Colors.white,
                                  color: PrimaryColor,
                                  onPressed: () {}
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              Container(
                margin: EdgeInsets.only(
                    left: 30.0, top: 50.0, right: 0.0, bottom: 40.0),

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
            Marca(),
             ]
        )
    );
  }

  Future ModelDeVheiculo() async {

    await showDialog(
        context: context,
        child: SimpleDialog(
            title: Text('Model de Vehiculo'),
            children: <Widget>[
              Model(),
            ]
        )
    );
  }


}


