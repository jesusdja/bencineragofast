import 'package:bencineragofast/pages/Home/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;

class Menu_dist extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  final GoogleMapController mapController;
  final Map<String,Place> markerMap;

  Menu_dist({this.onPressed, this.tooltip, this.icon,this.mapController,this.markerMap});

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<Menu_dist> with SingleTickerProviderStateMixin {


  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  String name_gas_button = '95';


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
      begin: Colors.red,
      end: Colors.red,
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

  //AGREGAR MARCADORES
  void initMarkers (String tipoDegas) async {

    Map<String,Place> markerMap = widget.markerMap;

    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    currentLocation = await location.getLocation();
    final lat = currentLocation["latitude"];
    final lng = currentLocation["longitude"];


    /*print(markerMap.length);*/
    void iterateMapEntry(key, value) {
      Place p = value;
      if(p.TipoGas == tipoDegas){
        initMarker(p.latitude,p.longitude,p.name);
      }
    }
    if(markerMap != null){
      markerMap.forEach(iterateMapEntry);
    }

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

  Widget add({String text, int tagg, String tipogas}) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){animate(); name_gas_button = text;initMarkers(tipogas);},
        tooltip: 'Add',
        heroTag: tagg,
        backgroundColor: Colors.red[900],
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
          ),
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.red[900],
        heroTag: 0,
        onPressed: animate,
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
        Transform(

          transform: Matrix4.translationValues(
            _translateButton.value * 3.0,
            0.0,
            0.0,
          ),
          child: add(text: '91', tagg: 1,tipogas: '91'),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * 2.0,
            0.0,
            0.0,
          ),
          child: add(text: '93',tagg: 2,tipogas: '93'),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            0.0,
            0.0,
          ),
          child: add(text: '95',tagg: 3,tipogas: '95'),
        ),
        toggle(),
      ],
    );
  }

}
