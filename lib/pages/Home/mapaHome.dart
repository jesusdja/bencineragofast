import 'package:bencineragofast/pages/Menu/AboutPage.dart';
import 'package:bencineragofast/pages/Menu/FavoritesPage.dart';
import 'package:bencineragofast/pages/Menu/HelpPage.dart';
import 'package:bencineragofast/pages/Menu/OptionsPage.dart';
import 'package:bencineragofast/pages/Menu/RegisterPage.dart';
import 'package:bencineragofast/pages/Listado/ListadoGasolineras.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../BotonesHome/menu_dist.dart';
import '../BotonesHome/menu_gas.dart';
import 'package:location/location.dart' as LocationManager;


import 'package:bencineragofast/pages/Listado/place_traker_app.dart';




class mapaHomePage extends StatefulWidget {

  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<mapaHomePage> {

  GoogleMapController mapController;

  String buscarDirecccion;

  AppBar appBar = new AppBar(

    title: new Text("GoFast Bencineras"),
    backgroundColor: Color.fromRGBO(11,87,56,100) ,

    actions: <Widget>[


      IconButton(

        iconSize: 40,
        icon: Icon(Icons.map),
        tooltip: 'Lista de Gasolineras',
        onPressed: () {
       /*   AppState.updateWith(
            context,
            viewType:
            AppState.of(context).viewType == PlaceTrackerViewType.map
                ? PlaceTrackerViewType.list
                : PlaceTrackerViewType.map,
          );*/
        },
      ),

    ],
  );

  void initState() {
    //initMarker(8.2960045,-62.7330581,'hola');
    //initMarker(8.2942766,-62.7355364,'hola2');
  }


  initMarker(double lat, double log, String name) {
    mapController.clearMarkers().then((val) {
      mapController.addMarker(MarkerOptions(
          position:
          LatLng(lat,log),
          draggable: false,
          infoWindowText: InfoWindowText(name, 'Cool')));
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(color: Colors.teal[800]),
                accountName: new Text('Nombre de Usuario'),
                accountEmail: new Text('Vehiculo Registrado')),
            new ListTile(
              title: new Text('Registrarse'),
              trailing: new Icon(Icons.directions_car),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new  Registrarse()));
              },
            ),
            new ListTile(
              title: new Text("Opciones"),
              trailing: new Icon(Icons.build),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new opciones()));//Modificacion
              },
            ),
            new ListTile(
              title: new Text("Favoritos"),
              trailing: new Icon(Icons.star),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => favoritos(),
                ),
                );
              },
            ),
            Divider(),
            new ListTile(
              title: new Text("Acerca de"),
              trailing: new Icon(Icons.pages),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutPage(),
                ),
                );
              },
            ),
            new ListTile(
              title: new Text("Ayuda"),
              trailing: new Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Ayuda(),
                ),
                );
              },
            ),
            new ListTile(
              title: new Text("Cerrar"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,

            options: GoogleMapOptions(
                cameraPosition: CameraPosition(
                    target: LatLng(0,0),
                    zoom: 0.1),
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                trackCameraPosition: true,
                rotateGesturesEnabled: true, //Activar gestos de rotación
                scrollGesturesEnabled: true, //Puede o no mover el mapa
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: 20.0,
            child: Menu_dist(),
          ),
         Positioned(
            right: 10.0,
            bottom: 90.0,
            child: Menu_gas(mapController: mapController),
          ),
        ],
      ),
    );
  }

  void refresh() async {

    final center = await getUserLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 15.0)));
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

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });

    refresh();
    initMarker(8.2960045,-62.7330581,'hola');
    initMarker(8.2942766,-62.7355364,'hola2');
  }
}