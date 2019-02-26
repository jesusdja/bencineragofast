import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../BotonesHome/menu_fab.dart';
import '../BotonesHome/menu_distancia.dart';
import '../BotonesHome/menu_dist.dart';
import 'package:location/location.dart' as LocationManager;




class mapaHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mapaHomePage> {

  GoogleMapController mapController;

  String buscarDireccion;

  AppBar appBar = new AppBar(title: new Text("GoFast Bencineras"), backgroundColor: Color.fromRGBO(11,87,56,100) ,); //#0B5738

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
            ),
          ),
          /*Positioned(
            right: 16.0,
            bottom: 90.0,
            child: MenuFAB(),
          ),
          Positioned(
            right: 16.0,
            bottom: 16.0,
            child: Menu_distancia(),
          ),*/
          Positioned(
            right: 16.0,
            bottom: 16.0,
            child: Menu_dist(),
          ),
        ],
      ),
    );
  }


  //Funcion que creamos para busqueda por direccion
  barraBusqueda() {
    //MenuFAB();
  }

  void refresh() async {
    final center = await getUserLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 15.0)));
    //getNearbyPlaces(center);
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
  }
}