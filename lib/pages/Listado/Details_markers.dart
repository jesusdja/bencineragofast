import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'package:bencineragofast/pages/Home/mapaHome.dart';



class DetailsMarkers extends StatefulWidget {

  DetailsMarkers({this.mapController});

  final GoogleMapController mapController;

  @override
  _DetailsMarkersState createState() => new _DetailsMarkersState();
}


class _DetailsMarkersState extends State<DetailsMarkers> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      key: _formKey,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Opciones '),
      ),
      body: new Container(

      ),
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


