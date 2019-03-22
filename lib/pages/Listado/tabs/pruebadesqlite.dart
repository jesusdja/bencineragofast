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



  String _deviceid = 'Unknown';


  @override
  void initState() {
    super.initState();
    initDeviceId();
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



    return ListView.builder(
        itemCount:1,
        itemBuilder: (context, index) {
          return  Container(


          );
        }
    );

  }



/*Future addRecord() async {
    var db = new DatabaseHelper();
    var user = new User(_modelController.text,_deviceid);

      await db.saveUser(user);
    }
*/

}