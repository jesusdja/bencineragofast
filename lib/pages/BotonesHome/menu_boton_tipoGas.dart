import 'package:bencineragofast/api/services.dart';
import 'package:bencineragofast/pages/Home/place.dart';
import 'package:bencineragofast/pages/Listado/Details_markers.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as math64;

class Menu_tgas extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  final GoogleMapController mapController;
  final Map<String,Place> markerMap;

  Menu_tgas({this.onPressed, this.tooltip, this.icon,this.mapController,this.markerMap});

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<Menu_tgas> with SingleTickerProviderStateMixin {


  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  List<String> ListaConbustibles = new List<String>();
  String name_gas_button = 'All';
  services Servicios = new services();


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

    ListaConbustibles = Servicios.extraerNombresTiposGas();
    /*ListaConbustibles.add("Todas");ListaConbustibles.add("86");ListaConbustibles.add("87");ListaConbustibles.add("88");
    ListaConbustibles.add("89");ListaConbustibles.add("90");ListaConbustibles.add("91");ListaConbustibles.add("92");
    ListaConbustibles.add("93");ListaConbustibles.add("94");ListaConbustibles.add("95");ListaConbustibles.add("96");
    ListaConbustibles.add("97");ListaConbustibles.add("98");ListaConbustibles.add("15");ListaConbustibles.add("16");
    ListaConbustibles.add("17");ListaConbustibles.add("18");ListaConbustibles.add("19");ListaConbustibles.add("20");*/
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

    String ValorKm = "";

    var db = new DatabaseHelper();
    User user = null;
    if(await db.queryRowCount() != 0){
      user = await db.getUser();
      ValorKm = user.botonDisGas;
    }

    User userUp = null;
    if(user != null){
      userUp = new User(1,user.device_id,user.botonDisGas,tipoDegas);
      db.updatebtngas(userUp);
    }

    List<String> keyys = new List<String>();
    void iterateMapEntry(key, value) {
      Place p = value;
      bool siencontrotipo=false;
      for(int i=0;i<p.tiposgas.length;i++){
        String tipo = p.tiposgas[i];
        if(tipoDegas == tipo){siencontrotipo = true; i = p.prices.length;}
      }
      //MODIFICAR
      if(((siencontrotipo)||("All" == tipoDegas))&((calcularDistancia(lat,lng,p.latitude,p.longitude,ValorKm))||("All" == ValorKm))){
        keyys.add(key);
        initMarker(p,tipoDegas);
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
  borrarMarcadores(){
    widget.mapController.clearMarkers().then((val){});
  }

  initMarker(Place place,String tipoDegas) async{

    String te = '';
    if(tipoDegas == 'All'){
      for(int i=0; i < place.prices.length;i++){
        te =  te + ' / ' + place.tiposgas[i];
      }
    }else{
      for(int i=0; i < place.prices.length;i++){
        if(place.tiposgas[i] == tipoDegas){
          te =' - ' + place.tiposgas[i] + ' = ' + place.prices[i] + ' CLP';
        }
      }
    }

    String url = '';
    String cod = place.image + 'gim';

    try{
      if(place.image == '1'){
        url = "assets/images/brand_icons/1.png";
      }else{
        url = "assets/images/brand_icons/$cod.png";
      }
    }catch(e){
    }

    borrarMarcadores();
    GoogleMapController mapController2 = widget.mapController;
    final Marker marker = await mapController2.addMarker(MarkerOptions(
      visible: true,
      draggable: true,
      flat: false,
      position: LatLng(place.latitude,place.longitude),
      infoWindowText: InfoWindowText(place.brand, te),
      icon: BitmapDescriptor.fromAsset(url),
    )
    );
    widget.markerMap[marker.id] = place;
  }

  bool calcularDistancia(double lat1, double lg1, double lat2, double lg2, String distancia){
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
    if(d <= double.parse('$distancia')){rango = true;}
    return rango;
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

  Widget texttoggle(){

    String nombre = name_gas_button;

    if(name_gas_button == 'All'){
      nombre = 'Todas';
    }/*else{
      if(name_gas_button == 'kerosene'){nombre = 'K';}
      if(name_gas_button == 'electricity'){nombre = 'E';}
      if(name_gas_button == 'ethanol'){nombre = 'E';}
      if(name_gas_button == 'diesel'){nombre = 'D';}
      if(name_gas_button == 'voltex'){nombre = 'V';}
    }*/
    return Text(
      nombre,
      style: TextStyle(
          color: Colors.white,
          fontSize: 18.0
      ),
    );
  }

  Widget toggle() {
    return FloatingActionButton.extended(
      onPressed: MarksDetiposGas,
      backgroundColor: Colors.green[800],
      icon: Icon(Icons.local_gas_station),
      label: texttoggle(),
      elevation: 5.0,
    );
  }

  Future MarksDetiposGas() async {
    await showDialog(
        context: context,
        // ignore: deprecated_member_use
        child: SimpleDialog(
            title: Text('Tipos de Combustibles'),
            children: <Widget>[
              Combustibles(),
            ]
        )
    );
  }

  Combustibles() {
    var y = 20;
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: Container(
        child: ListView.builder(
          itemCount: ListaConbustibles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ListaConbustibles[index]),
              leading: Image.asset('assets/images/icono_gas.png',height: 50),
              onTap: () {
                setState(() {
                  String te = ListaConbustibles[index] ;
                  if(te == 'Todas'){
                    te = 'All';
                  }
                  name_gas_button = te;
                  initMarkers(te);
                });

                Navigator.pop(context);
              },
            );
          },
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
