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


class _DetailsMarkersState extends State<DetailsMarkers> {

  final _formKey = GlobalKey<FormState>();
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

  Widget _detailsBody() {
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
      child: _detailsBody(),
    );

    return new Scaffold(
      key: _formKey,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text(widget.place.id + ' - ' + widget.place.description),
      ),
      body:  Stack(
       children: <Widget>[
         contenedor_mapa,
         button_Goto(),
       ],
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

class button_Goto extends StatelessWidget{


  nada(){
    debugPrint('*****************');
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 60.0,
      bottom: 370.0,
      child: Container(
        child: FloatingActionButton(
          child: Icon(Icons.place),
          backgroundColor: Colors.teal[800],
          heroTag: 3,
          onPressed: nada(),
          tooltip: 'Toggle',
        ),
      ),
    );
  }

}


