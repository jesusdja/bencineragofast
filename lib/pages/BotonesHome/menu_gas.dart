import 'package:bencineragofast/pages/Home/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mate;
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bencineragofast/pages/Home/mapaHome.dart';
import 'package:location/location.dart' as LocationManager;
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';

class Menu_gas extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  final Map<String,Place> markerMap;


  Menu_gas({this.onPressed, this.tooltip, this.icon,this.mapController,this.markerMap});

  final GoogleMapController mapController;

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<Menu_gas> with SingleTickerProviderStateMixin {

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  String name_gas_button = '20';

  @override
  initState() {

    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _buttonColor = ColorTween(
      begin: mate.Colors.red,
      end: mate.Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));

    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {

    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  //AGREGAR MARCADORES
  void initMarkers (double distancia) async {

    Map<String,Place> markerMap = widget.markerMap;

    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    currentLocation = await location.getLocation();
    final lat = currentLocation["latitude"];
    final lng = currentLocation["longitude"];


    /*print(markerMap.length);*/
    void iterateMapEntry(key, value) {
      Place p = value;
      if(calcularDistancia(lat,lng,p.latitude,p.longitude,distancia)){
        initMarker(p.latitude,p.longitude,p.name);
      }
    }
    if(markerMap != null){
      markerMap.forEach(iterateMapEntry);
    }


    /*if(calcularDistancia(lat,lng,8.2965626,-62.7356024,distancia)){
      initMarker(8.2965626,-62.7356024,'- 2 km');
    }

    if(calcularDistancia(lat,lng,8.270346,-62.7579366,distancia)){
      initMarker(8.270346,-62.7579366,'- 10 km');
    }

    if(calcularDistancia(lat,lng,8.2081334,-62.8328788,distancia)){
      initMarker(8.2081334,-62.8328788,'- 20 km');
    }*/

  }



  initMarker(double lat, double log, String name) {

    GoogleMapController mapController2 = widget.mapController;
    mapController2.clearMarkers().then((val) {
      mapController2.addMarker(MarkerOptions(
        visible: true,
        draggable: true,
        flat: false,
        position: LatLng(lat,log),
        infoWindowText: InfoWindowText(name, 'Cool'),
        icon: BitmapDescriptor.fromAsset("assets/images/icono_gas.png"),
      )
      );
    });

  }

  bool calcularDistancia(double lat1, double lg1, double lat2, double lg2, double distancia){
    bool rango = false;
    double d = 0.0;
    double radio = 6378;
    double SumLat = radians(lat2 - lat1);
    double Sumlg = radians(lg2 - lg1);
    double a =  math.pow((math.sin(SumLat / 2)),2) +
        math.cos(radians(lat1)) *
            math.cos(radians(lat2)) *
            math.pow((math.sin(Sumlg / 2)),2) ;
    double c = 2 * (math.atan2(math.sqrt(a),math.sqrt(1 - a)));
    d = radio * c;
    if(d <= distancia){rango = true;}
    return rango;
  }

  //AGREGAR BOTONES INTERNOS
  Widget add({String text, int tagg, double zoom, double dis}) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){animate(); name_gas_button = text;refresh(zoom);initMarkers(dis);},
        tooltip: 'Add',
        heroTag: tagg,
        backgroundColor: mate.Colors.red[900] ,
        child: Text(
          text + 'Km',
          style: TextStyle(
              color: mate.Colors.white,
              fontSize: 18.0
          ),
        ),
      ),
    );
  }

  //AGREGAR BOTON INICIAL
  Widget toggle() {

    return Container(
      child: FloatingActionButton(
        backgroundColor: mate.Colors.red[900],
        onPressed: animate,
        heroTag: 4,
        tooltip: 'Toggle',
        child: Text(
        name_gas_button + 'Km',
        style: TextStyle(
          color: mate.Colors.white,
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
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 3.0,
            0.0,
            0.0,
          ),
          child: add(text: '2',tagg: 5,zoom: 17,dis: 2),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 2.0,
            0.0,
            0.0,
          ),
          child: add(text: '10',tagg: 6,zoom: 15,dis: 10),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            0.0,
            0.0,
          ),
          child: add(text: '20', tagg: 7,zoom: 13,dis: 20),
        ),
        toggle(),
        //initMarkers(20),
      ],
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
