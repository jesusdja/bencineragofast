import 'package:bencineragofast/pages/Menu/Combustible.dart';
import 'package:bencineragofast/pages/Menu/Marca2.dart';
import 'package:bencineragofast/pages/Menu/Modelo.dart';
import 'package:bencineragofast/pages/Menu/Years.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';
import 'dart:core';
import 'package:bencineragofast/pages/sqlflite/vehiculo.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/scheduler.dart';

class Registrarse extends StatefulWidget {

  Registrarse({this.Marcasdecarros});

  final List<Marca2> Marcasdecarros;

  @override
  _RegistrarseState createState() => new _RegistrarseState();
}
class _RegistrarseState extends State<Registrarse> {

  DatabaseHelper db = new DatabaseHelper();

  Marca2 marca ;
  var modelo = new List<String>();
  var years = new List<String>();
  var combustible = new List<String>();

  List<Modelo> Modelosdecarro = new List<Modelo>();
  Modelo var_modelo;

  List<Year> Yearsdecarros = new List<Year>();
  Year var_year;

  List<Combustible> Combustibledecarros = new List<Combustible>();
  Combustible var_Combustible;

  Vehiculo carropull;

  String _valueMarca = '';
  String _valueModel = '';
  String _valueYear = '';
  String _valueCombustible = '';

  String _valueIdMarca = '';
  String _valueIdModelo = '';
  String _valueIdYears = '';
  String _valueIdCombustible = '';

  bool _isButtonDisabledmarca = false;
  bool _isButtonDisabledmodel = true;
  bool _isButtonDisabledyear = true;
  bool _isButtonDisabledcombustible = true;
  bool _isButtonDisabledSave = true;

  bool _activatebutton1 = true;
  bool _activatebutton2 = true;
  bool _activatebutton3 = true;
  bool _activatesave = true;


  _ElementosMarca({List<Marca2> marca}) {
    return Container(
      child: ListView.builder(
        itemCount: marca.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(marca[index].name),
            leading: Image.asset('assets/images/icono_gas.png', height: 50),

            onTap: () {
              setState(() {
                _valueMarca= marca[index].name;
                _valueIdMarca = marca[index].id;
                _valueModel ='Desconocido';
                _valueYear= 'Desconocido';
                _valueCombustible='Desconocido';
                _isButtonDisabledmodel = false;
                _isButtonDisabledcombustible =true;
                _activatebutton1 =false;
                _activatebutton2 =true;
                _activatebutton3 =true;
                _isButtonDisabledSave = true;
                _activatesave = true ;

                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              print(marca[index].id);
              Navigator.pop(context);
            },
          );

        },
      ),
    );
  }
  Marca() {
    var y = widget.Marcasdecarros.length;
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: _ElementosMarca(marca: List.generate(y, (i) => widget.Marcasdecarros[i],
        ),),

    );
  }

  _ElementosModel({List<Modelo> modelo}) {
    return Container(
      child: ListView.builder(
        itemCount: modelo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(modelo[index].name),
            leading: Image.asset('assets/images/icono_gas.png', height: 50),

            onTap: () {
              setState(() {
                _valueModel = modelo[index].name;
                _valueIdModelo = modelo[index].id;
                _activatebutton2 =false;
                _activatebutton3 =true;
                _isButtonDisabledyear = false;
                _isButtonDisabledcombustible =true;
                _valueYear ='Desconocido';
                _valueCombustible ='Desconocido';
                _isButtonDisabledSave = true;
                _activatesave = true ;
                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
  Model() {
    var y = Modelosdecarro.length;
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: _ElementosModel(modelo: List.generate(y, (i) => Modelosdecarro[i],
      ),),

    );
  }

  cargarmodelos()
  {
    print(_valueIdMarca); // para albert
    var_modelo= Modelo(id: '1',name: 'fiesta');Modelosdecarro.add(var_modelo);
    var_modelo= Modelo(id: '2',name: 'malibu');Modelosdecarro.add(var_modelo);
    var_modelo= Modelo(id: '3',name: 'Fox');Modelosdecarro.add(var_modelo);
    var_modelo= Modelo(id: '4',name: 'chevette');Modelosdecarro.add(var_modelo);
  }

  _ElementosYears({List<Year> years}) {
    return Container(
      child: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(years[index].name),
            leading: Image.asset('assets/images/icono_gas.png', height: 50),
            onTap: () {
              setState(() {
                _valueYear = years[index].name;
                _valueIdYears = years[index].id;
                _isButtonDisabledcombustible = false;
                _activatebutton3 = false;
                _valueCombustible ='Desconocido';
                _isButtonDisabledSave = true;
                _activatesave = true ;
                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
  Years() {
    var y = Yearsdecarros.length;
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: _ElementosYears(
        years: List.generate(y, (i) =>Yearsdecarros[i],
        ),
      ),
    );
  }

  cargaryears(){

    var_year =Year(id: '1', name: '2019');Yearsdecarros.add(var_year);
    var_year =Year(id: '1', name: '2018');Yearsdecarros.add(var_year);
    var_year =Year(id: '1', name: '2017');Yearsdecarros.add(var_year);
    var_year =Year(id: '1', name: '2015');Yearsdecarros.add(var_year);
    var_year =Year(id: '1', name: '2014');Yearsdecarros.add(var_year);

  }

  _ElementosCombustible({List<Combustible> combustible}) {
    return Container(
      child: ListView.builder(
        itemCount: combustible.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(combustible[index].name),
            leading: Image.asset('assets/images/icono_gas.png', height: 50),
            onTap: () {
              setState(() {

                _valueCombustible= combustible[index].name;
                _valueIdCombustible = combustible[index].id;
                _isButtonDisabledSave = false;
                _activatesave = false ;
                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  Combustibles() {
    var y = Combustibledecarros.length;
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: _ElementosCombustible(
        combustible: List.generate(y, (i) => Combustibledecarros[i],
        ),
      ),
    );
  }

  CargarCombustible(){
    var_Combustible = Combustible(id: '1',name: '1000'); Combustibledecarros.add(var_Combustible);
    var_Combustible = Combustible(id: '2',name: '200'); Combustibledecarros.add(var_Combustible);
    var_Combustible = Combustible(id: '3',name: '40'); Combustibledecarros.add(var_Combustible);
    var_Combustible = Combustible(id: '4',name: '30'); Combustibledecarros.add(var_Combustible);
    var_Combustible = Combustible(id: '5',name: '70'); Combustibledecarros.add(var_Combustible);
    var_Combustible = Combustible(id: '6',name: '10000000'); Combustibledecarros.add(var_Combustible);

}
  void initvalues() async {
    carropull = await db.getCarro();

    setState(() {

      if(carropull.idMarca != 'Desconocido'){

         _activatebutton1 = false;
         _activatebutton2 = false;
         _activatebutton3 = false;
         _activatesave = false;
          _isButtonDisabledmodel = false;
          _isButtonDisabledyear = false;
          _isButtonDisabledcombustible = false;
          _isButtonDisabledSave = false;


      }
      _valueMarca = carropull.marcaVehiculo;
      _valueModel = carropull.modeloVehiculo;
      _valueYear = carropull.yearsVehiculo;
      _valueCombustible = carropull.combustible;
      _valueIdMarca = carropull.idMarca;
      _valueIdModelo = carropull.idModelo;
      _valueIdYears = carropull.idYears;
      _valueIdCombustible = carropull.idCombustible;
    });
  }
  @override
  void initState() {
    super.initState();
    initvalues();
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
               Combustibles(),
              ]
          )
      );
    }
    @override
    Widget build(BuildContext context) {

      return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: PrimaryColor,
          title: new Text('Registrar Vehiculo'),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 50, top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ),
                                AbsorbPointer(
                                  absorbing: _isButtonDisabledmarca,
                                  child: SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * .5,
                                    child: FlatButton(
                                        child: Text(_valueMarca),
                                        //Valor a cambiar
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
                          Image.asset(
                            'assets/images/icono_shell.png', width: 100,
                            height: 100,
                          ), //=====No va , icono de otra cosa
                        ],
                      ),
                    ),
                    //--------------------------------First Mark
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Seleccione Modelo',
                              textAlign: TextAlign.justify,
                              //overflow: TextOverflow.ellipsis, ...
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          AbsorbPointer(
                            absorbing: _isButtonDisabledmodel,

                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: FlatButton(

                                  child: Text(_valueModel),
                                  splashColor: Colors.black,
                                  padding: const EdgeInsets.all(25.0),
                                  textColor: Colors.white,
                                  color: _activatebutton1
                                      ? Colors.grey
                                      : PrimaryColor,
                                  onPressed: () {
                                    cargarmodelos();
                                    ModelDeVheiculo();
                                    Modelosdecarro.clear();
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                    //--------------------------------Second Model
                    Container(
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
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
                                  color: _activatebutton2
                                      ? Colors.grey
                                      : PrimaryColor,
                                  onPressed: () {
                                    cargaryears();
                                    YearsVehiculo();
                                    Yearsdecarros.clear();
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                          AbsorbPointer(
                            absorbing: _isButtonDisabledcombustible,
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .5,
                              child: FlatButton(
                                  child: Text(_valueCombustible),
                                  splashColor: Colors.black,
                                  padding: const EdgeInsets.all(25.0),
                                  textColor: Colors.white,
                                  color: _activatebutton3
                                      ? Colors.grey
                                      : PrimaryColor,
                                  onPressed: () {
                                    CargarCombustible();
                                    ConbustibleVheiculo();
                                    Combustibledecarros.clear();
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Image.asset('assets/images/icono_gas.png',width: 80,height: 110,),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 30.0, top: 50.0, right: 0.0),
                        child:AbsorbPointer(
                          absorbing:_isButtonDisabledSave,
                          child:  SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              padding: const EdgeInsets.all(30.0),
                              color:_activatesave ? Colors.grey : PrimaryColor,
                              elevation: 5.0,
                              textColor: Colors.white,
                              splashColor: Colors.black,

                              onPressed: () async {
                                if (await db.queryRowCountCarro() != 0) {
                                  Vehiculo vehiculoUp = null;
                                  vehiculoUp = new Vehiculo(1, _valueMarca, _valueModel, _valueYear,_valueCombustible,_valueIdMarca,_valueIdModelo,_valueIdYears,_valueIdCombustible);
                                  db.updateCarro(vehiculoUp);
                                  Navigator.pop(context);
                                } else {
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
                        )
                    ),
                  ],
                ),
              ),

              );
            }
        ),
      );
    }
  }

