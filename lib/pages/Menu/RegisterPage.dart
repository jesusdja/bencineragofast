import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';

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
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();


  final _modelController = TextEditingController();
  final _tipocombustibleController = TextEditingController();
  final _capacidadController = TextEditingController();

  Object $Combustibleuser;

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente


     return ListView.builder(
      itemCount:1,
      itemBuilder: (context, index) {
        return  Container(

          margin: EdgeInsets.only(left: 60,right: 40),

          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(

                  margin: EdgeInsets.only(left: 0.0,top: 60.0,right: 0.0,bottom: 40.0),
                  width: MediaQuery.of(context).size.width,



                  child: TextFormField(

                    controller: _modelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Modelo',
                      prefixIcon: Icon(Icons.directions_car),
                    ),
                    autofocus: true,


                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo Vacio';
                      }
                    },


                  ),



                ),

                Container(
                 margin: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 40.0),
                  width: MediaQuery.of(context).size.width,


                  child:  TextFormField(
                    controller: _tipocombustibleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.bookmark),

                        labelText: 'Tipo de Combustible'

                    ),
                    autofocus: true,

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo Vacio';
                      }
                    },
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 80.0),
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(

                    child:  TextFormField(
                      controller: _capacidadController,

                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(


                          border: OutlineInputBorder(),

                          prefixIcon: Icon(Icons.featured_video),
                          labelText: 'Capacidad de Combustible'
                      ),
                      autofocus: true,

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    width: 300,

                  ),

                ),



                SizedBox(
                  child:Container(

                    width: MediaQuery.of(context).size.width,

                    child: RaisedButton(

                      textColor: Colors.white,
                      color: PrimaryColor,
                      padding: const EdgeInsets.all(20.0),
                      elevation: 5.0,

                      splashColor: Colors.black,
                      onPressed: () {


                        // devolverá true si el formulario es válido, o falso si
                        // el formulario no es válido.
                        if (_formKey.currentState.validate()) {

                          String modeluser = _modelController.text;
                          String combustibleuser = _tipocombustibleController.text;
                          String capacidaduser = _capacidadController.text ;

                          print(modeluser);
                          print(combustibleuser);
                          print(capacidaduser);
                          /* AlertDialog(
                        title: Text('Registrado'),
                        elevation: 10,
                      );*/

                          // Si el formulario es válido, queremos mostrar un Snackbar
                          Scaffold
                              .of(context)
                              .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }

                        Navigator.pop(context);
                      },
                      child: Text('Registrar'),

                    ),


                  ),


                ),

              ],
            ),
          ),
        );
      }
    );

  }
}