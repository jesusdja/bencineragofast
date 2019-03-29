import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;
import 'package:device_id/device_id.dart';
import 'dart:math' as math;

import 'place.dart';
import 'package:bencineragofast/main.dart';
import 'package:bencineragofast/pages/Listado/Details_markers.dart';
import 'package:vector_math/vector_math_64.dart' as math64;
import 'package:bencineragofast/pages/sqlflite/vehiculo.dart';
import 'package:bencineragofast/pages/Menu/AboutPage.dart';
import 'package:bencineragofast/pages/Menu/FavoritesPage.dart';
import 'package:bencineragofast/pages/Menu/HelpPage.dart';
import 'package:bencineragofast/pages/Menu/OptionsPage.dart';
import 'package:bencineragofast/pages/Menu/RegisterPage.dart';
import 'package:bencineragofast/pages/Listado/ListadoGasolineras.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import '../BotonesHome/menu_boton_tipoGas.dart';
import '../BotonesHome/menu_boton_distancia.dart';


class mapaHomePage extends StatefulWidget {


  String _valueMarca;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mapaHomePage> {

  GoogleMapController mapController;
  LatLng MelatLng;
  Map<String,Place> markerMap = Map();
  Place placed;
  var db ;
  String _deviceid = 'Unknown';

  @override
  void initState() {
    db = new DatabaseHelper();
    initDeviceId();
    super.initState();
  }

  //Inicializar variable de Id del telefono
  void initDeviceId() async {
    String deviceid;
    deviceid = await DeviceId.getID;
    if (!mounted) return;
    setState(() {
      _deviceid = deviceid;
    });
    if(await db.queryRowCountCarro() != 0){
      print("ya esta registrado el carro");

      final allRows = await db.queryAllRowsCarro();
      print('query all rows:');
      allRows.forEach((row) => print(row));

    }else{
      String _marcaVehiculo = 'Desconocido';
      String _modeloVehiculo = 'Desconocido';
      String _years_vehiculo= 'Desconocido';
      String _combustible= 'Desconocido';
      var carro = new Vehiculo(1, _marcaVehiculo, _modeloVehiculo, _years_vehiculo, _combustible);
      db.saveCarro(carro);
      print("Registro de carro Existoso");

    }

    if(await db.queryRowCount() != 0){
      print("ya esta registrado el Usuario");
      User userUp = new User(1,_deviceid,"20","All");
      db.updatebtngas(userUp);
      db.updateBtnDis(userUp);
      final allRows = await db.queryAllRows();
      print('query all rows:');
      allRows.forEach((row) => print(row));
    }else{
      String btngas = "All";
      String btndis = "20";
      var user = new User(1,_deviceid,btndis,btngas);
      db.saveUser(user);
      print("registro Exitoso de Usuario");
    }
  }

  //AGREGAR MARCADORES
  void initMarkers() {
    //10 KM
    LatLng latlo = LatLng(8.270346,-62.7579366);
    List<String> precios = new List<String>();precios.add('800');precios.add('600');precios.add('900');precios.add('800');precios.add('600');precios.add('900');precios.add('800');precios.add('600');precios.add('900');
    List<String> tipogas = new List<String>();tipogas.add('91');tipogas.add('95');tipogas.add('93');tipogas.add('91');tipogas.add('95');tipogas.add('93');tipogas.add('91');tipogas.add('95');tipogas.add('93');
    List<String> Servicios = new List<String>(); Servicios.add('SERVICIO 1');Servicios.add('SERVICIO 2');
    placed = Place(id: 1,address: 'Dirección 1', latLng: latlo ,brand: 'Gaslonera 1',prices: precios,tiposgas: tipogas,last_price_update: '50000000',services: Servicios,  marca: 'SHELL',favorito: false);
    initMarker(placed);
    //2 KM
    latlo = LatLng(8.2965626,-62.7356024);
    precios = new List<String>();precios.add('100');precios.add('200');precios.add('600');precios.add('200');
    tipogas = new List<String>();tipogas.add('93');tipogas.add('95');tipogas.add('91');tipogas.add('80');
    Servicios = new List<String>(); Servicios.add('SERVICIO 3');Servicios.add('SERVICIO 2');
    placed = Place(id: 2,address: 'Dirección 2', latLng: latlo ,brand: 'Gaslonera 2',prices: precios,tiposgas: tipogas,last_price_update: '50000000',services: Servicios,  marca: 'PETROBRAS',  favorito: false);
    initMarker(placed);
    //20 KM
    latlo = LatLng(8.2081334,-62.8328788);
    precios = new List<String>();precios.add('500');precios.add('600');
    tipogas = new List<String>();tipogas.add('95');tipogas.add('93');
    Servicios = new List<String>(); Servicios.add('SERVICIO 1');Servicios.add('SERVICIO 2');
    placed = Place(id: 3,address: 'Dirección 3', latLng: latlo ,brand: 'Gaslonera 3',prices: precios,tiposgas: tipogas,last_price_update: '50000000',services: Servicios,  marca: 'COPEC',  favorito: true);
    initMarker(placed);
    //2 KM
    latlo = LatLng(8.2965626,-62.7356024);
    precios = new List<String>();precios.add('100');
    tipogas = new List<String>();tipogas.add('95');
    Servicios = new List<String>(); Servicios.add('SERVICIO 4');Servicios.add('SERVICIO 2');
    placed = Place(id: 3,address: 'Dirección 4', latLng: latlo ,brand: 'Gaslonera 4',prices: precios,tiposgas: tipogas,last_price_update: '50000000',services: Servicios,  marca: 'SHELL',  favorito: false);
    initMarker(placed);

  }

  initMarker(Place place) async {

    if(await calcularDistancia(place.latLng.latitude,place.latLng.longitude,'20')){
      GoogleMapController mapController2 = mapController;
      //mapController.onMarkerTapped.add(_onInfoWindowTapped);
      mapController2.clearMarkers().then((val) async {
        final Marker marker = await mapController2.addMarker(MarkerOptions(
          visible: true,
          draggable: true,
          flat: false,
          position: place.latLng,
          infoWindowText: InfoWindowText(place.brand, place.address),
          icon: BitmapDescriptor.fromAsset("assets/images/icono_gas.png"),
        )
        );
        markerMap[marker.id] = place;
      });
    }

  }

  void _onInfoWindowTapped(Marker marker) {
    final marcador_seleccionado = markerMap[marker.id];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DetailsMarkers(mapController: mapController, place: marcador_seleccionado);
      }),
    );
  }

  Future<bool> calcularDistancia(double lat2, double lg2, String distancia) async {

    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    currentLocation = await location.getLocation();
    final lat = currentLocation["latitude"];
    final lng = currentLocation["longitude"];
    double lat1 = lat;
    double lg1 = lng;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("GoFast Bencineras"),
        backgroundColor: PrimaryColor ,
          actions: <Widget>[
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.map),
              tooltip: 'Lista de Gasolineras',
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ListadoGasolineras(mapController: mapController, markerMap: markerMap,MelatLng: MelatLng,)),
                );
              },
            ),
          ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(color: PrimaryColor,
                 ),
                accountName: new Text('Nombre de Usuario'),
                accountEmail: new Text('Vehiculo Registrado')),
            new ListTile(
              title: new Text('Registrar Vehiculo'),
              trailing: new Icon(Icons.directions_car),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new  Registrarse()));
              },
            ),
            new ListTile(
              title: new Text("Opciones"),
              trailing: new Icon(Icons.build),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new opciones(mapController: mapController)));//Modificacion
              },
            ),
            new ListTile(
              title: new Text("Favoritos"),
              trailing: new Icon(Icons.star),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => favoritos(),
                ),
                );
              },
            ),
            Divider(
              height: 30.0,
            ),
            new ListTile(
              title: new Text("Acerca de"),
              trailing: new Icon(Icons.pages),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutPage(),
                ),
                );
              },
            ),
            new ListTile(
              title: new Text("Ayuda"),
              trailing: new Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Ayuda(),
                ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            options: GoogleMapOptions(
                cameraPosition: CameraPosition(
                    target: LatLng(0,0),
                    zoom: 0.1),
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                trackCameraPosition: true,
                rotateGesturesEnabled: true, //Activar gestos de rotación
                scrollGesturesEnabled: true, //Puede o no mover el mapa
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: 20.0,
            width: MediaQuery.of(context).size.width,
            child: Menu_tgas(mapController: mapController,markerMap: markerMap,),
          ),
         Positioned(
            right: 10.0,
            bottom: 90.0,
           width: MediaQuery.of(context).size.width,
            child: Menu_bdis(mapController: mapController,markerMap: markerMap,),
          ),
        ],
      ),
    );
  }

  void refresh() async {

    mapController.onInfoWindowTapped.add(_onInfoWindowTapped);
    final center = await getUserLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 11.0)));
  }

  Future<LatLng> getUserLocation() async {
    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    try {
      currentLocation = await location.getLocation();
      final lat = currentLocation["latitude"];
      final lng = currentLocation["longitude"];

      MelatLng = LatLng(lat,lng);


      //final dist =
      final center = LatLng(lat, lng);
      return center;
    } on Exception {
      currentLocation = null;
      return null;
    }
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });

    refresh();
    initMarkers();
  }
}