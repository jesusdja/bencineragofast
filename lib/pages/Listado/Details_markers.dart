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
  bool _isFavorited = true;


  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        print("ELIMINADO DE FAVORITOS");
      } else {
        _isFavorited = true;
        print("AGREGADO DE FAVORITOS");
      }
    });
  }

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
    return
      _Map(
        center: widget.place.latLng,
        mapController: mapController,
        onMapCreated: onMapCreated,

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


  DetallesConIcono(String nombre, String Descripcion, IconData ico){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                nombre,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,),
            ),
            Row(
              children: <Widget>[
                Icon(ico),
                Expanded(child: Text(
                  Descripcion,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsBody() {
    return ListView(
      //padding: const EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0, bottom: 0.0),
      children: <Widget>[

        Stack( //**********************MAPAS**********************
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(11,90,70,60),
                      Colors.white,
                    ]),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 28.0, top: 12.0, right: 28.0, bottom: 0.0),
                  child: _MapPlace(),
                ),
                Positioned(
                  right: 40.0,
                  bottom: 10.0,
                  child: ButtonGo(),
                ),
              ],
            ),
          ],
        ),
        Container( //**********************ESTRELLA**********************
          margin: EdgeInsets.only(left: 28.0, top: 0.0, right: 28.0, bottom: 0.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*2*/
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'NOMBRE DE LA BENCINERA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Descripción de la bencinera.',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                iconSize: 60,
                icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
                color: Colors.orange,
                onPressed: _toggleFavorite,
              ),
            ],
          ),
        ),
        Container(//**********************DETALLES DE PLACE 1 **********************
          margin: EdgeInsets.only(left: 28.0, top: 10.0, right: 28.0, bottom: 20.0),
          child: Row(
            children: <Widget>[
              DetallesConIcono("Detalle Bencinera 1","Información Destalle 1",Icons.local_gas_station),
              DetallesConIcono("Detalle Bencinera  2","Información Destalle 2",Icons.place),
            ],
          ),
        ),
        Container(//**********************DETALLES DE PLACE 1 **********************
          margin: EdgeInsets.only(left: 28.0, top: 10.0, right: 28.0, bottom: 20.0),
          child: Row(
            children: <Widget>[
              DetallesConIcono("Detalle Bencinera 3","Información Destalle 3",Icons.thumb_up),
              DetallesConIcono("Detalle Bencinera 4","Información Destalle 4",Icons.accessibility),
            ],
          ),
        ),
        Container(//**********************DETALLES DE PLACE 1 **********************
          margin: EdgeInsets.only(left: 28.0, top: 10.0, right: 28.0, bottom: 20.0),
          child: Row(
            children: <Widget>[
              DetallesConIcono("Detalle Bencinera 5","Información Destalle 5",Icons.access_time),
              DetallesConIcono("Detalle Bencinera 6","Información Destalle 6",Icons.branding_watermark),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text(widget.place.id + ' - ' + widget.place.description),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _detailsBody(),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
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







