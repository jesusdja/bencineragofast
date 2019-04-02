import 'dart:async';

import 'package:bencineragofast/pages/Home/place.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Listado/Details_markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as math64;
import 'package:location/location.dart' as LocationManager;

class marcador_distancia extends StatefulWidget {

  marcador_distancia({this.mapController,this.markerMap,this.controller,this.kmActual,this.MelatLng});

  final Map<String,Place> markerMap;
  final GoogleMapController mapController;
  final TabController controller;
  final String kmActual;
  final LatLng MelatLng;

  @override
  _displayState createState() => new _displayState();
}

class _displayState extends State<marcador_distancia> {

  Map<String,Place> markerMap;
  List<Place> places = new List<Place>();
  var db;
  String kmActual;
  LatLng MelatLng;

  @override
  void initState() {

    db = new DatabaseHelper();
    kmActual = widget.kmActual;
    MelatLng = widget.MelatLng;

    TraerUsuario();


    super.initState();
  }

  double calcularDistancia(double lat2, double lg2){

    double lat1 = MelatLng.latitude;
    double lg1 = MelatLng.longitude;

    bool rango = false;
    double d = 0.0;
    double radio = 6378;
    double SumLat = math64.radians(lat2 - lat1);
    double Sumlg = math64.radians(lg2 - lg1);
    double a =  math.pow((math.sin(SumLat / 2)),2) +
        math.cos(math64.radians(lat1)) *
            math.cos(math64.radians(lat2)) *
            math.pow((math.sin(Sumlg / 2)),2) ;
    double c = 2 * (math.atan2(math.sqrt(a),math.sqrt(1 - a)));
    d = radio * c;
    return d;
  }

  TraerUsuario() async {
    User u = await db.getUser();
    setState(() {
      kmActual = u.botonDisGas;
    });

    markerMap = widget.markerMap;
    Future iterateMapEntry(key, value) {
      Place p = value;
      double d = calcularDistancia(p.latitude,p.longitude);
      if(kmActual != null){
        if(double.parse('$kmActual') > d){
          places.add(p);
        }
      }
    }
    markerMap.forEach(iterateMapEntry);

    List<Place> places_total = places;
    List<Place> places_ordenado = new List<Place>();

    places_total = places;
    int  pos = 0;
    double aux = 20,dis = 0;
    bool Entrar = true;

    while(Entrar) {
      if(places_total.length == 0){
        Entrar = false;
      }
      aux = 1000.0;
      for(int i = 0; i < places_total.length; i++){
        dis = calcularDistancia(places_total[i].latitude,places_total[i].longitude);
        if(dis < aux){
          aux = dis;
          pos = i;
        }
      }
      if(aux != 1000.0){
        places_ordenado.add(places_total[pos]);
        places_total.removeAt(pos);
      }
    }
    places = places_ordenado;


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(places[index].brand),
            subtitle: Text(calcularDistancia(places[index].latitude,places[index].longitude).toStringAsFixed(2) + ' Km' /*+ (((calcularDistancia(places[index].latitude,places[index].longitude)/ 20)*60).toStringAsFixed(2) + ' min' )*/), //MODIFICAR
            leading: Image.asset('assets/images/icono_gas.png',height: 50),
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return DetailsMarkers(mapController: widget.mapController, place: places[index]);
                    }),
              );
            },
          );
        },
      ),
    );
  }
}