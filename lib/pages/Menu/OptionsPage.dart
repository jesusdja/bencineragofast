import 'package:bencineragofast/pages/Home/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';//Desde Dependencias
import 'package:location/location.dart' as LocationManager;
import 'package:bencineragofast/pages/Home/mapaHome.dart';
import 'package:bencineragofast/main.dart';


class opciones extends StatefulWidget {

  opciones({this.mapController, this.place});

  final GoogleMapController mapController;
  final Place place;

  @override
  _opcionesState createState() => new _opcionesState();
}


enum TipodeMarca{todas,Copec,Petrobras,Shell,Terpel}// variable global de marcas
enum TipodeMapa{Normal,Satelital,Otro} //Vairables de tipo Mapa

class _opcionesState extends State<opciones> {

  GoogleMapController mapController;
  LatLng MelatLng;
  String _valueMapa = 'Seleccione mapa';
  MapType _valueMapaOption = MapType.normal;
  void _setValueMapa(String valueMapa) => setState(() => _valueMapa = valueMapa);

  String _valueMarca = 'Marca Favorita';
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
              child: FlatButton(
                splashColor: Colors.black,

                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Satelital"),
                  onPressed: (){Navigator.pop(context ,TipodeMapa.Satelital); },//LLamar a la funcion CambiarmapaSatelital
              ),



            ),
            new SimpleDialogOption(

              child: new FlatButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                 color: PrimaryColor,
                child: new Text("Normal"),
                onPressed: (){Navigator.pop(context, TipodeMapa.Normal) ;
                },
              ),


            ),
            new SimpleDialogOption(
              child: new FlatButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Otro"),
                onPressed: (){Navigator.pop(context, TipodeMapa.Otro);
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

        child: new SimpleDialog(
          //cada opcion tiene que ser llamada por un SimpleDialog
          title: new Text('Tipo de Marca'),
          children: <Widget>[
            new SimpleDialogOption(

              child: new FlatButton(

                splashColor: Colors.black, //Efectos de click
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Todas"),
                onPressed: (){Navigator.pop(context, TipodeMarca.todas);}, //cambio de variable local
              ),

            ),
            new SimpleDialogOption(
              child: new FlatButton(
                splashColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                textColor: Colors.white,
                color: PrimaryColor,
                child: new Text("Copec"),
                onPressed: (){Navigator.pop(context, TipodeMarca.Copec);},
              ),

            ),
            new SimpleDialogOption(

              child: new FlatButton(
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
              child: new FlatButton(
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
              child: new FlatButton(
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

  Widget _MapPlace() {
    if(_valueMapa == 'Normal')
    {
        _valueMapaOption = MapType.normal;

    }
    if(_valueMapa == 'Satelital')
    {

        _valueMapaOption = MapType.satellite;

    }
    if(_valueMapa == 'Otro')
    {
        _valueMapaOption = MapType.terrain;
    }

    return

      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        elevation: 10.0,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: GoogleMap(
            onMapCreated: onMapCreated,
            options: GoogleMapOptions(
              mapType: _valueMapaOption,
              cameraPosition: CameraPosition(
                target: LatLng(8.29609, -62.7355),
                zoom: 16.0,
              ),
              zoomGesturesEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              scrollGesturesEnabled: false,

            ),
          ),
        ),
      );
  }

  void onMapCreated(controller) {
    mapController = controller;

  }

  @override
  void setState(fn) {

    if(_valueMapa == 'Normal')
    {
      _valueMapaOption = MapType.normal;

    }
    if(_valueMapa == 'Satelital')
    {

      _valueMapaOption = MapType.satellite;

    }
    if(_valueMapa == 'Otro')
    {
      _valueMapaOption = MapType.terrain;
    }
    super.setState(fn);
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: PrimaryColor,
        title: new Text('Opciones '),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                  child: Text(
                    'Tipo de Mapa',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    // height: double.infinity,
                    child: new FlatButton(
                      child: Text(_valueMapa),
                      splashColor: Colors.black,
                      padding: const EdgeInsets.all(15.0),
                     textColor: Colors.white,
                      color:PrimaryColor,
                      onPressed: _seleccionarMapa,
                                          ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 100.0,right: 0.0,bottom: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      color: PrimaryColor,
                      elevation: 5.0,
                      textColor: Colors.white,
                      splashColor: Colors.black,
                      onPressed: () {
                          if(_valueMapa == 'Normal')
                          {
                            CambiarmapaNormal();
                            refresh(15);
                          }
                          if(_valueMapa =='Satelital')
                          {
                              CambiarmapaSatelital();
                              refresh(15);
                          }
                          if(_valueMapa =='Otro')
                          {
                            CambiarmapaOtro();
                            refresh(15);
                          }
                        Navigator.pop(context);
                      },
                      child: Center(child: Center(child: Text('Establecer Configuracion'))),
                    ),
                  ),
                ),

              ],
            ),

          );
        },
      ),
    );


  }
  Future CambiarmapaOtro()  async {

    GoogleMapController mapController2 = widget.mapController;
    final center = await getUserLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 11.0)));
         mapController2.updateMapOptions(
        GoogleMapOptions(
          mapType: MapType.terrain,
        )
    );
  }
  void CambiarmapaNormal()  {
    GoogleMapController mapController2 = widget.mapController;
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



