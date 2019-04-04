import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/main.dart';



class pruebasqlite extends StatefulWidget {
  @override
  _pruebasqliteState createState() => new _pruebasqliteState();
}

class _pruebasqliteState extends State<pruebasqlite> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
  User user;
  var db ;
  String _deviceid = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceId();
    db = new DatabaseHelper();
  }

  void initDeviceId() async {
    String deviceid;
    deviceid = await DeviceId.getID;
    if (!mounted) return;
    setState(() {
      _deviceid = deviceid;
    });
  }



  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente

    if (user != null) {
      this.user=user;
      _modelController.text = user.device_id;
      _deviceid = user.device_id;
    }

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
                  SizedBox(
                    child:Container(
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: PrimaryColor,
                        padding: const EdgeInsets.all(20.0),
                        elevation: 5.0,
                        splashColor: Colors.black,
                        onPressed: ()  async {
                          //var user = new User(_deviceid,_modelController.text);
                          if (_formKey.currentState.validate()) {
                            if(await db.queryRowCount() != 0){
                              //_query();
                            }else{
                              int id =1;
                              String btngas = "95";
                              String btndis = "20";
                              var user = new User(id,_deviceid,btndis,btngas);
                              db.saveUser(user);
                              //_query();
                            }
                            //  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                          }
                          Navigator.of(context).pop();
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