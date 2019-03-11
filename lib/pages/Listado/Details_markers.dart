import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'package:bencineragofast/pages/Home/mapaHome.dart';
import 'package:bencineragofast/pages/Home/place.dart';



class DetailsMarkers extends StatefulWidget {

  DetailsMarkers({this.mapController, this.place});

  final GoogleMapController mapController;
  final Place place;

  @override
  _DetailsMarkersState createState() => new _DetailsMarkersState();
}


class _DetailsMarkersState extends State<DetailsMarkers> with SingleTickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  GoogleMapController mapController;


  String name_gas_button = '95';


  @override
  initState() {

  }

  nada(){
    debugPrint('*****************************');
  }


  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.red[900],
        heroTag: 0,
        onPressed: nada(),
        tooltip: 'Toggle',
        child: Text(
          name_gas_button,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row (
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        toggle(),
      ],
    );
  }



}
