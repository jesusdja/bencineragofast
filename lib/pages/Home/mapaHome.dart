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

import 'package:bencineragofast/main.dart';

import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart' as mate;
import 'package:bencineragofast/pages/Listado/Details_markers.dart';
import 'place.dart';

class mapaHomePage extends StatefulWidget {

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mapaHomePage> {

  GoogleMapController mapController;

  Map<String,Place> markerMap = Map();

  //AGREGAR MARCADORES
  void initMarkers() async {
    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    currentLocation = await location.getLocation();
    final lat = currentLocation["latitude"];
    final lng = currentLocation["longitude"];
    //markerMap[marker.id] = 'f';

    Place placed ;
    LatLng latlo = LatLng(8.2965626,-62.7356024);
    placed = Place(id: 'gas1', latLng: latlo , name: 'gase', description: 'menos 2 Km');
    initMarker(placed);
    latlo = LatLng(8.270346,-62.7579366);
    placed = Place(id: 'gas2', latLng: latlo , name: 'gase', description: 'menos 10 Km');
    initMarker(placed);
    latlo = LatLng(8.2081334,-62.8328788);
    placed = Place(id: 'gas3', latLng: latlo , name: 'gase', description: 'menos 20 Km');
    initMarker(placed);

  }

  initMarker(Place place) {
    GoogleMapController mapController2 = mapController;
    //mapController.onMarkerTapped.add(_onInfoWindowTapped);
    mapController2.clearMarkers().then((val) async {
      final Marker marker = await mapController2.addMarker(MarkerOptions(
        visible: true,
        draggable: true,
        flat: false,
        position: place.latLng,
        infoWindowText: InfoWindowText(place.id, place.description),
        icon: BitmapDescriptor.fromAsset("assets/images/icono_gas.png"),
      )
      );

      markerMap[marker.id] = place;
    });
  }


  void _onInfoWindowTapped(Marker marker) {
    final marcador_seleccionado = markerMap[marker.id];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DetailsMarkers(mapController: mapController, place: marcador_seleccionado);
      }),
    );
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(

        title: new Text("GoFast Bencineras"),
        backgroundColor: PrimaryColor ,
          actions: <Widget>[
            IconButton(

              iconSize: 40,
              icon: Icon(Icons.map),
              tooltip: 'Lista de Gasolineras',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ListadoGasolineras()),
                );
              },
            ),
          ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(color: PrimaryColor,

                 ),
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
                    new MaterialPageRoute(builder: (context) => new opciones(mapController: mapController)));//Modificacion
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
            Divider(
              height: 30.0,
            ),
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

    mapController.onInfoWindowTapped.add(_onInfoWindowTapped);
    final center = await getUserLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 13.0)));
  }

  Future<LatLng> getUserLocation() async {
    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    try {
      currentLocation = await location.getLocation();
      final lat = currentLocation["latitude"];
      final lng = currentLocation["longitude"];

      //final dist =
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
    initMarkers();
  }
}