import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';//Desde Dependencias
import 'package:location/location.dart' as LocationManager;
import 'package:bencineragofast/pages/Home/mapaHome.dart';
import 'package:bencineragofast/main.dart';


class opciones extends StatefulWidget {

  opciones({this.mapController});

  final GoogleMapController mapController;

  @override
  _opcionesState createState() => new _opcionesState();
}


enum TipodeMarca{todas,Copec,Petrobras,Shell,Terpel}// variable global de marcas
enum TipodeMapa{Normal,Satelital,Otro} //Vairables de tipo Mapa

class _opcionesState extends State<opciones> {

  final _formKey = GlobalKey<FormState>();


  String _valueMapa = '';
  void _setValueMapa(String valueMapa) => setState(() => _valueMapa = valueMapa);


  String _valueMarca = '';
  void _setValueMarca(String value) => setState(() => _valueMarca = value);

  Future _seleccionarMapa() async { //cambiar Nombre para funcion de ventan emerrgente
    switch(
    await showDialog(
        context: context,
        /*it shows a popup with few options which you can select, for option we
        created enums which we can use with switch statement, in this first switch
        will wait for the user to select the option which it can use with switch cases*/
        child: new SimpleDialog(
          title: new Text('Tipo de mapa'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Satelital"),
                  onPressed: (){Navigator.pop(context ,TipodeMapa.Satelital); CambiarmapaSatelital();refresh(15);},//LLamar a la funcion CambiarmapaSatelital
              ),

            ),
            new SimpleDialogOption(

              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                 color: PrimaryColor,
                child: new Text("Normal"),
                onPressed: (){Navigator.pop(context, TipodeMapa.Normal) ; CambiarmapaNormal();refresh(15);
                },
              ),


            ),
            new SimpleDialogOption(
              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Otro"),
                onPressed: (){Navigator.pop(context, TipodeMapa.Otro);CambiarmapaOtro();refresh(15);
                },
              ),

            ),
          ],
        )
    )
    ) {
      case TipodeMapa.Normal:
        _setValueMapa('Normal');
        break;
      case TipodeMapa.Satelital:
        _setValueMapa('Satelital');
        break;
      case TipodeMapa.Otro:
        _setValueMapa('Otro');
        break;
    }
  }
  Future _seleccionarMarca() async { //cambiar Nombre para funcion de ventan emerrgente
    switch(
    await showDialog( //Ventana de dialogo emergente
        context: context,

        child: new SimpleDialog( //cada opcion tiene que ser llamada por un SimpleDialog
          title: new Text('Tipo de Marca'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new RaisedButton(
                splashColor: Colors.black, //Efectos de click
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Todas"),
                onPressed: (){Navigator.pop(context, TipodeMarca.todas);}, //cambio de variable local
              ),

            ),
            new SimpleDialogOption(
              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Copec"),
                onPressed: (){Navigator.pop(context, TipodeMarca.Copec);},
              ),

            ),
            new SimpleDialogOption(

              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Petrobras"),
                onPressed: (){Navigator.pop(context, TipodeMarca.Petrobras);
                },
              ),


            ),
            new SimpleDialogOption(
              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Shell"),
                onPressed: (){Navigator.pop(context, TipodeMarca.Shell);
                },
              ),

            ),
            new SimpleDialogOption(
              child: new RaisedButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Terpel"),
                onPressed: (){Navigator.pop(context, TipodeMarca.Terpel);
                },
              ),

            ),
          ],
        )
    )
    ) {
      case TipodeMarca.todas: //seleccion de nombre de boton
        _setValueMarca('Todas');
        break;
      case TipodeMarca.Copec:
        _setValueMarca('Copec');
        break;
      case TipodeMarca.Petrobras:
        _setValueMarca('Petrobras');
        break;
      case TipodeMarca.Shell:
        _setValueMarca('Shell');
        break;
      case TipodeMarca.Terpel:
        _setValueMarca('Terpel');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {




    return new Scaffold(
      //key: _formKey,
      resizeToAvoidBottomPadding: false,// bloquear bugs de tama#o de Pantalla
      appBar: new AppBar(
        backgroundColor: PrimaryColor,
        title: new Text('Opciones '),


      ),

      body: new Container(
          padding: new EdgeInsets.all(32.0), //altura del boton
          child: new Column( //centrar all content
          children: <Widget>[ //trabajar y permitir multiples widgets
            Text(
              'Tipo de Mapa',
              textAlign: TextAlign.justify,
              //overflow: TextOverflow.ellipsis, ...
               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),

            ),

            new SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: new RaisedButton(
                child: Text(_valueMapa),
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color:PrimaryColor,
                onPressed: _seleccionarMapa,
              //  child: new Text(_valueMapa),


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

                elevation: 5.0,
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                onPressed: _seleccionarMarca,
                child: new Text(_valueMarca),

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
        Divider(
          height: 12.0,
        ),

        new TextField(

          autofocus: false,
          decoration: new InputDecoration(
            labelText: "Entre 100-1000",border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.euro_symbol),
          ),
          keyboardType: TextInputType.number,
        ),

        Divider(
          height: 20,
        ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: PrimaryColor,
                elevation: 5.0,
                textColor: Colors.white,
                splashColor: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(child: Center(child: Text('Establecer Configuracion'))),
              ),
            ),
      ],



    ),

    ),



    );


  }

  void CambiarmapaOtro()  {

    GoogleMapController mapController2 = widget.mapController;
    print(mapController2);

    mapController2.updateMapOptions(

        GoogleMapOptions(

          cameraPosition: CameraPosition(
            target: LatLng(8.29609, -62.7355),
          ),

          mapType: MapType.terrain,

        )
    );




  }
  void CambiarmapaNormal()  {

    GoogleMapController mapController2 = widget.mapController;
    print(mapController2);

    mapController2.updateMapOptions(

        GoogleMapOptions(

          cameraPosition: CameraPosition(
            target: LatLng(8.29609, -62.7355),
          ),

          mapType: MapType.normal,

        )
    );




  }

  void CambiarmapaSatelital()  {

      GoogleMapController mapController2 = widget.mapController;
      print(mapController2);

        mapController2.updateMapOptions(

        GoogleMapOptions(

          cameraPosition: CameraPosition(
            target: LatLng(8.29609, -62.7355),
          ),

          mapType: MapType.satellite,

        )
      );




}
  void refresh(double zoomcam) async {

    GoogleMapController mapController2 = widget.mapController;
    final center = await getUserLocation();
    mapController2.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: zoomcam)));
  }

  Future<LatLng> getUserLocation() async {
    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    try {
      currentLocation = await location.getLocation();
      final lat = currentLocation["latitude"];
      final lng = currentLocation["longitude"];
      final center = LatLng(lat, lng);
      return center;
    } on Exception {
      currentLocation = null;
      return null;
    }
  }

}


