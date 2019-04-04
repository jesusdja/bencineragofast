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

  String _valueMapa = 'Seleccione mapa';
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
    return
      _Map(
        center: widget.place.latLng,
        mapController: mapController,
        onMapCreated: onMapCreated,

      );
  }

  void onMapCreated(controller) {
    mapController = controller;
    mapController.clearMarkers().then((val) async {
      final Marker marker = await mapController.addMarker(MarkerOptions(
        visible: true,
        position: widget.place.latLng,
        icon: BitmapDescriptor.fromAsset("assets/images/icono_gas.png"),
      )
      );
    });
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

      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return new Container(
            padding: new EdgeInsets.all(32.0), //altura del boton
            child: new Column( //centrar all content
              children: <Widget>[ //trabajar y permitir multiples widgets
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                  child: Text(
                    'Tipo de Mapa',
                    textAlign: TextAlign.justify,
                    //overflow: TextOverflow.ellipsis, ...
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
                    //  elevation: 15.0,
                      color:PrimaryColor,
                      onPressed: _seleccionarMapa,

                      //  child: new Text(_valueMapa),


                    ),
                  ),
                ),
               /* Text(
                  'Marca Favorita',
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),

                ),

                new SizedBox(
                  width: double.infinity,
                  // height: double.infinity,
                  child: new FlatButton(

                  //  elevation: 15.0,
                    splashColor: Colors.black,
                    padding: const EdgeInsets.all(15.0),
                    textColor: Colors.white,
                    color: PrimaryColor,
                    onPressed: _seleccionarMarca,
                    child: new Text(_valueMarca),

                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 20.0,right: 0.0,bottom: 10.0),
                  child: Text(
                    'Precio ',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),

                  ),
                ),

                */

                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0, bottom: 0.0),
                          child: _MapPlace(),
                        ),
                      ],
                    ),



                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 150.0,right: 0.0,bottom: 40.0),

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
class _Map extends StatelessWidget{
  const _Map({
    @required this.center,
    @required this.mapController,
    @required this.onMapCreated,
    Key key,
  })  : assert(center != null),
        assert(onMapCreated != null),
        super(key: key);

  final LatLng center;
  final GoogleMapController mapController;
  final ArgumentCallback<GoogleMapController> onMapCreated;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            cameraPosition: CameraPosition(
              target: center,
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

}



