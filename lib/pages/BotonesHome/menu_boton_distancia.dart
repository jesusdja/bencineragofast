import 'package:bencineragofast/pages/Home/place.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mate;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';

class Menu_bdis extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  final Map<String,Place> markerMap;


  Menu_bdis({this.onPressed, this.tooltip, this.icon,this.mapController,this.markerMap});

  final GoogleMapController mapController;

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<Menu_bdis> with SingleTickerProviderStateMixin {

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  String name_gas_button = '20Km';

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
  void initMarkers (String distancia) async {

    Map<String,Place> markerMap = widget.markerMap;

    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    currentLocation = await location.getLocation();
    final lat = currentLocation["latitude"];
    final lng = currentLocation["longitude"];

    String ValorTipoGas = "";

    var db = new DatabaseHelper();
    User user = null;
    if(await db.queryRowCount() != 0){
      user = await db.getUser();
      ValorTipoGas = user.botonTipoGas;
    }

    User userUp = null;
    if(user != null){
      userUp = new User(1,user.device_id,distancia,user.botonTipoGas);
      db.updateBtnDis(userUp);
    }

    List<String> keyys = new List<String>();
    void iterateMapEntry(key, value) {
      Place p = value;
      bool siencontrotipo=false;
      for(int i=0;i<p.tiposgas.length;i++){
        String tipo = p.tiposgas[i];
        if(ValorTipoGas.toString() == tipo){siencontrotipo = true; i = p.prices.length;}
      }
      //MODIFICAR
      if(((siencontrotipo)||("All" == ValorTipoGas))&(calcularDistancia(lat,lng,p.latitude,p.longitude,distancia))){
        keyys.add(key);
        initMarker(p);

      }
    }
    if(markerMap != null){
      markerMap.forEach(iterateMapEntry);
    }
    for(var i = 0; i < keyys.length; i++){
      widget.markerMap.remove(keyys[i]);
    }
    if(keyys.length == 0){
      widget.mapController.clearMarkers();
    }
  }



  initMarker(Place place) {
    GoogleMapController mapController2 = widget.mapController;
    mapController2.clearMarkers().then((val) async {
      final Marker marker = await mapController2.addMarker(MarkerOptions(
        visible: true,
        draggable: true,
        flat: false,
        position: LatLng(place.latitude,place.longitude),
        infoWindowText: InfoWindowText(place.brand, place.address),
        icon: BitmapDescriptor.fromAsset("assets/images/icono_gas.png"),
      )
      );
      widget.markerMap[marker.id] = place;
    });
  }

  bool calcularDistancia(double lat1, double lg1, double lat2, double lg2, String distancia){
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
    if(d <= double.parse('$distancia')){rango = true;}
    return rango;
  }

  //AGREGAR BOTONES INTERNOS
  Widget add({String text, int tagg, double zoom, String dis}) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){animate(); name_gas_button = text;refresh(zoom);initMarkers(dis);},
        tooltip: 'Add',
        heroTag: tagg,
        backgroundColor: mate.Colors.green[700],
        child: Text(
          text,
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
        backgroundColor: mate.Colors.green[700],
        onPressed: animate,
        heroTag: 4,
        tooltip: 'Toggle',
        child: Text(
        name_gas_button,
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
            _translateButton.value* 3.0,
            0.0,
            0.0,
          ),
          child: add(text: '20Km', tagg: 7,zoom: 11,dis: '20'),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 2.0,
            0.0,
            0.0,
          ),
          child: add(text: '10Km',tagg: 6,zoom: 13,dis: '10'),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value ,
            0.0,
            0.0,
          ),
          child: add(text: '2Km',tagg: 5,zoom: 15,dis: '2'),
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
