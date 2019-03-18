import 'package:bencineragofast/pages/Home/place.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:bencineragofast/pages/Listado/Details_markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class display extends StatefulWidget {

  display({this.mapController,this.markerMap});

  final Map<String,Place> markerMap;
  final GoogleMapController mapController;

  @override
  _displayState createState() => new _displayState();
}

class _displayState extends State<display> {

  Map<String,Place> markerMap;
  List<Place> places;
  /*void initState(){
    markerMap = widget.markerMap;
    void iterateMapEntry(key, value) {
      Place p = value;
      print(p.description);
      places.add(p);
    }
    markerMap.forEach(iterateMapEntry);
  }*/


  @override
  Widget build(BuildContext context) {
    List<Place> places = new List<Place>();
    markerMap = widget.markerMap;
    void iterateMapEntry(key, value) {
      Place p = value;
      places.add(p);
    }
    markerMap.forEach(iterateMapEntry);

    return Scaffold(
      body: ListView.builder(
        itemCount: widget.markerMap.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(places[index].description),
            subtitle: Text(places[index].id),
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