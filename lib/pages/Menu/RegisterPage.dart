import 'package:bencineragofast/api/protos/maker.pbenum.dart';
import 'package:bencineragofast/api/services.dart';
import 'package:bencineragofast/pages/Menu/Combustible.dart';
import 'package:bencineragofast/pages/Menu/Marca2.dart';
import 'package:bencineragofast/pages/Menu/Modelo.dart';
import 'package:bencineragofast/pages/Menu/Years.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';
import 'dart:core';
import 'package:bencineragofast/pages/sqlflite/vehiculo.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:recase/recase.dart';


class Registrarse extends StatefulWidget {

  Registrarse({this.carmarks});

  final List<Marca2> carmarks;

  @override
  _RegistrarseState createState() => new _RegistrarseState();
}
class _RegistrarseState extends State<Registrarse> {

  DatabaseHelper db = new DatabaseHelper();

  Marca2 mark ;
  var model = new List<String>();
  var years = new List<String>();
  var combustible = new List<String>();

  List<Modelo> carmodels = new List<Modelo>();
  Modelo varModel;
  Marca2 rc;

  List<Year> yearscars = new List<Year>();
  Year varYear;

  List<Combustible> fuelcars = new List<Combustible>();
  Combustible varFuel;

  Vehiculo carropull;

  String _valueMarca = '';
  String _valueMarcaSend = '';
  String _valueModel = '';
  String _valueModelSend = '';
  String _valueYear = '';
  String _valueCombustible = '';
  String logo;

  String _valueIdMarca = '';
  String _valueIdModelo = '';
  String _valueIdYears = '';
  String _valueIdCombustible = '';

  bool _isButtonDisabledmarca = false;
  bool _isButtonDisabledmodel = true;
  bool _isButtonDisabledyear = true;
  bool _isButtonDisabledSave = true;

  bool _activatebutton1 = true;
  bool _activatebutton2 = true;
  bool _activatesave = true;
  services Services = new services();

  Maker maker ;


  MarkElement({List<Marca2> marca}) {
    return Container(
      child: ListView.builder(
        itemCount: marca.length,
        itemBuilder: (context, index) {

       /*   if(widget.carmarks[index].logo == widget.carmarks[index].name )
            {
               logo = widget.carmarks[index].logo;
            }else{
              logo = 'assets/images/icons/negro.jpg';
          }*/
          return ListTile(
            title: Text(ModificarCamel(widget.carmarks[index].name.toString())),
            leading: Image.asset(widget.carmarks[index].logo , height: 60,width: 60),
            onTap: () {
                setState(() {
                  logo = widget.carmarks[index].logo;
                  _valueMarca= ModificarCamel(marca[index].name.toString());
                _valueMarcaSend = marca[index].name;
                _valueIdMarca = marca[index].id;
                _valueModel ='Desconocido';
                _valueYear= 'Desconocido';
                _valueCombustible='Desconocido';
                _isButtonDisabledmodel = false;
                _activatebutton1 =false;
                _activatebutton2 =true;
                _isButtonDisabledSave = true;
                _activatesave = true ;
                initModel();
                //DEVOLVER ID Y NOMBRE DE LA MARCA SELECCIONADA
              });
              Navigator.pop(context);
            },
          );

        },
      ),
    );
  }


  Marca() {
    var y = widget.carmarks.length;
    return new Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: MarkElement(marca: List.generate(y, (i) => widget.carmarks[i],

      ),),

    );
  }
  ModificarCamel(String cadena) {
    ReCase rc = ReCase(cadena);
    Marca2 modf;
    if(cadena.length > 3)
      {
        modf = Marca2(id: '1', name: rc.titleCase.toString(),logo: '');
      }else{
        modf = Marca2(id: '1', name: rc.constantCase.toString(),logo:'');
          }

    return modf.name.toString();
  }

  _ElementosModel({List<Modelo> modelo}) {
    return Container(
      child: ListView.builder(
        itemCount: modelo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(modelo[index].name),
            leading: Image.asset(logo, height: 50),

            onTap: () {
              setState(() {
                _valueModel = ModificarCamel(modelo[index].name.toString());
                _valueModelSend = modelo[index].name;
                _valueIdModelo = modelo[index].id;
                _activatebutton2 =false;
                _isButtonDisabledyear = false;
                _valueYear ='Desconocido';
                _valueCombustible ='Desconocido';
                _isButtonDisabledSave = true;
                _activatesave = true ;
                initYears();
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
    var y = carmodels.length;
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: _ElementosModel(modelo: List.generate(y, (i) => carmodels[i],
      ),),

    );
  }

  initModel()async {carmodels = await Services.TraerModelos(_valueMarcaSend);}

  cargarmodelos() async{initModel();}

  initYears()async {yearscars = await Services.GetVehiculosYears(_valueMarcaSend, _valueModelSend);}

  _ElementosYears({List<Year> years}) {
    return Container(
      child: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(years[index].name),
            leading: Image.asset(logo, height: 50),
            onTap: () {
              setState(() {
                _valueYear = years[index].name;
                _valueIdYears = years[index].id;
                _valueCombustible ='Desconocido';
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
  Years() {
    var y = yearscars.length;
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: _ElementosYears(
        years: List.generate(y, (i) =>yearscars[i],
        ),
      ),
    );
  }
  cargarLogo() async{
    carropull = await db.getCarro();
    print(carropull.logo.toString());
  }
  Widget logoOut(String logo) {

    if(logo == null)
      {
        return Image.asset('assets/images/icono_gas.png',height: 80,width: 80,);

      }else{
      return Image.asset(logo, height: 80,width: 80,);
    }
  }

  cargaryears(){initYears();}

  _ElementosCombustible({List<Combustible> combustible}) {
    return Container(
      child: ListView.builder(
        itemCount: combustible.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(combustible[index].name),
            leading: Image.asset(logo, height: 50),
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


  void initvalues() async {
    try{
  carropull = await db.getCarro();
  setState(() {
    if(carropull.idMarca != 'Desconocido'){
      _activatebutton1 = false;
      _activatebutton2 = false;
      _activatesave = false;
      _isButtonDisabledmodel = false;
      _isButtonDisabledyear = false;
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
     logo = carropull.logo;
  });

    }catch(e){}
  }
  @override
  void initState() {
    initvalues();
    super.initState();
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: PrimaryColor,
        title: new Text('Registrar Vehiculo'),
      ),
      body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 50, top: 20),
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
                                  margin: EdgeInsets.only(bottom: 30),
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


                              ],

                            ),

                          ),
                          //==============ICONOOOO
                          logoOut(logo),
                        ],
                      ),
                    ),
                    //--------------------------------First Mark
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 30, top: 20),
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
                                    carmodels.clear();
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
                            margin: EdgeInsets.only(bottom: 30, top: 20),
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
                                    yearscars.clear();
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.only(
                            left: 30.0, top: 70.0),
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
                                  vehiculoUp = new Vehiculo(1, _valueMarca, _valueModel, _valueYear,_valueCombustible,_valueIdMarca,_valueIdModelo,_valueIdYears,_valueIdCombustible,logo);
                                  db.updateCarro(vehiculoUp);
                                  Navigator.pop(context);

                                } else {
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

            ),

    );
  }
}
