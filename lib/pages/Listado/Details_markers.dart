import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'package:bencineragofast/pages/Home/mapaHome.dart';
import 'package:bencineragofast/pages/Home/place.dart';
import 'package:url_launcher/url_launcher.dart';



class DetailsMarkers extends StatefulWidget {

  DetailsMarkers({this.mapController, this.place});

  final GoogleMapController mapController;
  final Place place;

  @override
  _DetailsMarkersState createState() => new _DetailsMarkersState();
}


class _DetailsMarkersState extends State<DetailsMarkers> {

  GoogleMapController mapController;

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

  Widget _MapPlace() {
    return ListView(
        children: <Widget>[
          _Map(
            center: widget.place.latLng,
            mapController: mapController,
            onMapCreated: onMapCreated,
          ),
        ]
    );
  }

  _launchURL() async {

    var lat_place = widget.place.latitude;
    var log_place = widget.place.longitude;

    var lng_me = log_place;
    var lat_me = lat_place;

    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    try {
      currentLocation = await location.getLocation();
      lat_me = currentLocation["latitude"];
      lng_me = currentLocation["longitude"];
    } on Exception {
      currentLocation = null;
      return null;
    }

    var url = 'https://www.google.com/maps/dir/$lat_me,$lng_me/$lat_place,$log_place/@$lat_place,$log_place,16.75z';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '*********************Could not launch $url';
    }
  }


  // ignore: non_constant_identifier_names
  Widget ButtonGo() {
    return FloatingActionButton(
      onPressed: _launchURL,
      //child: Image.asset("assets/images/translade.png"),
      child: Icon(Icons.place),
      backgroundColor: Colors.teal[800],
    );
  }

  bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  Widget Favorite(){

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    var contenedor_mapa =  Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 18.0,right: 24.0,left: 24.0,bottom: 0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [
              Color.fromRGBO(11,90,70,60),
              Colors.white,
            ]),
      ),
      child: _MapPlace(),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text(widget.place.id + ' - ' + widget.place.description),
      ),
      body: Stack(
        children: <Widget>[
          contenedor_mapa,
          Positioned(
            right: 60.0,
            bottom: 370.0,
            child: ButtonGo(),
          ),
          Column(
            children: <Widget>[

            ],
          ),
        ],
      ),
    );

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
        width: 340.0,
        height: 200.0,
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





