import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';
import 'dart:core';
import 'package:bencineragofast/pages/sqlflite/vehiculo.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/scheduler.dart';

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
   List<Vehiculo> vehiculo;
  MyCustomFormState({Key key, @required this.vehiculo,});


  Vehiculo carropull;

  String _valueMarca       = 'Desconocido';
  String _valueModel       = 'Desconocido';
  String _valueYear        = 'Desconocido';
  String _valueCombustible = 'Desconocido';
  bool _isButtonDisabledmarca =      false;
  bool _isButtonDisabledmodel =       true;
  bool _isButtonDisabledyear =        true;
  bool _isButtonDisabledcombustible = true;

  bool _activatebutton1 = true;
  bool _activatebutton2 = true;
  bool _activatebutton3 = true;
  bool _activatebutton4 = false;



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
                  _isButtonDisabledmarca =true;
                  _isButtonDisabledmodel = false;
                  _activatebutton1 = false;

                  //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
                });
                print(_valueMarca);
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
          y, (i) => Vehiculo(1,'Shell',' ','',''),
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
            onTap: () {
              setState(() {
                _valueModel = vehiculo[index].modeloVehiculo;
                _isButtonDisabledmodel = true;
                _isButtonDisabledyear = false;
                _activatebutton2 = false;

                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              print(_valueModel);
              Navigator.pop(context);
            },
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
          y, (i) => Vehiculo(1,'','Model $i','',''),
        ),
      ),
    );
  }

  _ElementosYears({List<Vehiculo> vehiculo}) {
    return Container(
      child: ListView.builder(
        itemCount: vehiculo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehiculo[index].yearsVehiculo),
            leading: Image.asset('assets/images/icono_gas.png',height: 50),
            onTap: () {
              setState(() {
                _valueYear = vehiculo[index].yearsVehiculo;
                _isButtonDisabledyear = true;
                _isButtonDisabledcombustible = false;
                _activatebutton3 = false;
                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              print(_valueYear);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
  Years() {
    var y = 20;
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: _ElementosYears (
        vehiculo: List.generate(
          y, (i) => Vehiculo(1,'','','Year $i',''),
        ),
      ),
    );
  }

  _ElementosCombustible({List<Vehiculo> vehiculo}) {
    return Container(
      child: ListView.builder(
        itemCount: vehiculo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehiculo[index].combustible),
            leading: Image.asset('assets/images/icono_gas.png',height: 50),
            onTap: () {
              setState(() {
                _valueCombustible = vehiculo[index].combustible;
                _isButtonDisabledmarca =true;
                _isButtonDisabledmodel =true;
                _isButtonDisabledyear =true;
                _isButtonDisabledcombustible =true;

                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              print(_valueCombustible);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
  Combustible() {
    var y = 20;
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: _ElementosCombustible (
        vehiculo: List.generate(
          y, (i) => Vehiculo(1,'','','','Combustible $i'),
        ),
      ),
    );
  }

//===========================FUNCIONES DE LOS BOTONES=============================== ARRIBA

  void initvalues() async {
    carropull = await db.getCarro();
   setState(() {
     _valueMarca = carropull.marcaVehiculo;
     _valueModel =carropull.modeloVehiculo;
     _valueYear =carropull.yearsVehiculo;
     _valueCombustible =carropull.combustible;
   });
  }
  @override
  void initState() {
    super.initState();
    initvalues();
  }

  Widget build(BuildContext context) {

    return ListView.builder (

        itemCount: 1,
        itemBuilder: (context, index) {
          return Container (
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 20, right: 50, top: 10),
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
                         AbsorbPointer(
                           absorbing: _isButtonDisabledmarca,
                           child:  SizedBox(
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
                         ),

                      //==============ICONOOOO
                        ],
                      ),

                    ),
                    Image.asset('assets/images/icono_shell.png',width: 100,height: 100,
                    ),//=====No va , icono de otra cosa
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
                              margin: EdgeInsets.only(bottom: 10, top: 10),
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
                          AbsorbPointer(
                            absorbing: _isButtonDisabledmodel,

                            child:   SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .5,
                              child: FlatButton(

                                  child: Text(_valueModel),
                                  splashColor: Colors.black,
                                  padding: const EdgeInsets.all(25.0),
                                  textColor: Colors.white,
                                  color: _activatebutton1 ? Colors.grey:  PrimaryColor ,
                                  onPressed: () {
                                    ModelDeVheiculo();}
                              ),
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
                             margin: EdgeInsets.only(bottom: 20, top: 10),
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
                           AbsorbPointer(
                             absorbing: _isButtonDisabledyear,
                             child: SizedBox(
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width * .5,
                               child: FlatButton(
                                   child: Text(_valueYear),
                                   splashColor: Colors.black,
                                   padding: const EdgeInsets.all(25.0),
                                   textColor: Colors.white,
                                   color: _activatebutton2 ? Colors.grey:  PrimaryColor ,
                                   onPressed: () {YearsVehiculo();}
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                    // Image.asset('assets/images/icono_gas.png',width: 80,height: 80,),
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
                              margin: EdgeInsets.only(bottom: 20, top: 10),
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
                           AbsorbPointer(
                             absorbing: _isButtonDisabledcombustible,
                             child:  SizedBox(
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width * .5,
                               child: FlatButton(
                                   child: Text(_valueCombustible),
                                   splashColor: Colors.black,
                                   padding: const EdgeInsets.all(25.0),
                                   textColor: Colors.white,
                                   color: _activatebutton3 ? Colors.grey:  PrimaryColor ,
                                   onPressed: () {ConbustibleVheiculo();}
                               ),
                             ),
                           ),
                          ],
                        ),
                      ),
                     // Image.asset('assets/images/icono_gas.png',width: 80,height: 110,),
                    ],
                  ),
                ),
                Container(
                margin: EdgeInsets.only(
                    left: 30.0, top: 50.0, right: 0.0),

                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width ,
                  child: RaisedButton(
                    padding: const EdgeInsets.all(30.0),
                    color: PrimaryColor,

                    elevation: 5.0,
                    textColor: Colors.white,
                    splashColor: Colors.black,

                    onPressed: () async {
                      if(await db.queryRowCountCarro() != 0){
                        Vehiculo vehiculoUp = null;
                        vehiculoUp = new Vehiculo(1, _valueMarca, _valueModel, _valueYear, _valueCombustible);
                             db.updateCarro(vehiculoUp);
                             Navigator.pop(context);
                      }else
                        {
                          print('Verifique valores');
                        }
                    },
                    child: Center(
                        child: Center(
                            child: Text('Guardar Vehiculo',)

                        )
                    ),
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
        // ignore: deprecated_member_use
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
  Future YearsVehiculo() async {
    await showDialog(
        context: context,
        child: SimpleDialog(
            title: Text('Año del Vehiculo'),
            children: <Widget>[
                Years(),
            ]
        )
    );
  }
  Future ConbustibleVheiculo() async {
    await showDialog(
        context: context,
        child: SimpleDialog(
            title: Text('Combustible del Vehiculo'),
            children: <Widget>[
              Combustible(),
            ]
        )
    );
  }
}
