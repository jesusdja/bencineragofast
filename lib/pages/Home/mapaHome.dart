import 'package:bencineragofast/api/protos/fuel_type.pbenum.dart';
import 'package:bencineragofast/api/services.dart';
import 'package:bencineragofast/pages/Home/intro_screen.dart';
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
import 'dart:core';
import 'package:bencineragofast/pages/Menu/AboutPage.dart';
import 'package:bencineragofast/pages/Menu/Marca2.dart';
import 'package:bencineragofast/pages/Menu/OptionsPage.dart';
import 'package:bencineragofast/pages/Menu/RegisterPage.dart';
import 'package:bencineragofast/pages/Listado/ListadoGasolineras.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import '../BotonesHome/menu_boton_tipoGas.dart';
import '../BotonesHome/menu_boton_distancia.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class mapaHomePage extends StatefulWidget {


  String _valueMarca;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<mapaHomePage> {

  GoogleMapController mapController;
  LatLng MelatLng;
  Map<String,Place> markerMap = Map();

  List<Marca2> Marcasdecarros = new List<Marca2>();
  Marca2 var_marca;

  Place placed;
  var db ;
  String _deviceid = 'Unknown';
  String KmActual;
  String TipoGasActual;
  String NameVehiculo = '';
  Vehiculo Nombrecarro;
  bool estadoNombre =true;
  String parte1;
  String parte2;
  String parte3;

  var fuel_stations_list;

  services Sevicios = new services();

  @override
  void initState() {
    db = new DatabaseHelper();
    initDeviceId();
    PeticionHttpTotal();
    super.initState();
  }

  void PeticionHttpTotal() async{
   Sevicios.ConnectionTest();
   String recibe =  Sevicios.GetTipos(FuelType.valueOf(12)); //pasar valor
  print(recibe);
  }

  Future<http.Response> fetchPost() {
    return http.get('http://192.168.1.7:3000/fuel_stations?coordinates=-33.4515714&coordinates=-70.6784017&radius=10');
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
      Nombrecarro = await  db.getCarro();
      parte1 = Nombrecarro.marcaVehiculo;
      parte2 = Nombrecarro.modeloVehiculo;
      parte3 = Nombrecarro.yearsVehiculo;
      if(Nombrecarro.idMarca == 'Desconocido')
      {
        setState(() {
          NameVehiculo = 'Vehiculo No Registrado';
        });
      }else{
        setState(() {
          NameVehiculo = parte1 + ' ' + parte2+ ' ' + parte3;
          estadoNombre = false;
        });
      }
      print("ya esta registrado el carro");

      final allRows = await db.queryAllRowsCarro();
      print('query all rows:');
      allRows.forEach((row) => print(row));

    }else{
      String _marcaVehiculo = 'Desconocido';
      String _modeloVehiculo = 'Desconocido';
      String _years_vehiculo= 'Desconocido';
      String _combustible= 'Desconocido';
      String _idMarca = 'Desconocido';
      String _idModelo = 'Desconocido';
      String _idYears = 'Desconocido';
      String _idCombustible = 'Desconocido';

      var carro = new Vehiculo(1, _marcaVehiculo, _modeloVehiculo, _years_vehiculo, _combustible,_idMarca,_idModelo,_idYears,_idCombustible);
      db.saveCarro(carro);
      print("Registro de carro Existoso" );

    }
    if(await db.queryRowCountFavoritos != 0) {

      print('Tabla de favoritos con registros');

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
      TipoGasActual = "All";
      KmActual = "20";
      var user = new User(1,_deviceid,KmActual,TipoGasActual);
      db.saveUser(user);
      print("registro Exitoso de Usuario");
    }
  }

  //AGREGAR MARCADORES
  void initMarkers() {

    markerMap.clear();

    //10 KM
    LatLng latlo = LatLng(8.270346,-62.7579366);
    List<String> precios = new List<String>();precios.add('800');precios.add('600');precios.add('900');precios.add('800');precios.add('600');precios.add('900');precios.add('800');precios.add('600');precios.add('900');
    List<String> tipogas = new List<String>();tipogas.add('91');tipogas.add('95');tipogas.add('93');tipogas.add('98');tipogas.add('80');tipogas.add('86');tipogas.add('87');tipogas.add('88');tipogas.add('89');
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
    latlo = LatLng(8.2950868,-62.7361771);
    precios = new List<String>();precios.add('100');
    tipogas = new List<String>();tipogas.add('95');
    Servicios = new List<String>(); Servicios.add('SERVICIO 4');Servicios.add('SERVICIO 2');
    placed = Place(id: 4,address: 'Dirección 4', latLng: latlo ,brand: 'Gaslonera 4',prices: precios,tiposgas: tipogas,last_price_update: '50000000',services: Servicios,  marca: 'SHELL',  favorito: false);
    initMarker(placed);

    var_marca = Marca2(id: '1', name: 'Ford');Marcasdecarros.add(var_marca);
    var_marca = Marca2(id: '2', name: 'Toyota');Marcasdecarros.add(var_marca);
    var_marca = Marca2(id: '3', name: 'Ferrari');Marcasdecarros.add(var_marca);


  }

  initMarker(Place place) async {

    if(await calcularDistancia(place.latLng.latitude,place.latLng.longitude,'20')){
      GoogleMapController mapController2 = mapController;
      //mapController.onMarkerTapped.add(_onInfoWindowTapped);
      mapController2.clearMarkers().then((val) async {
        final Marker marker = await mapController2.addMarker(
            MarkerOptions(
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

  BotonActualizar() async {

    User u = await db.getUser();
    String StipoGas = u.botonTipoGas;
    String Sdis = u.botonDisGas;
    var currentLocation = <String, double>{};
    final location = LocationManager.Location();
    currentLocation = await location.getLocation();
    final lat = currentLocation["latitude"];
    final lng = currentLocation["longitude"];

    double zoom = 11.0;
    if(Sdis == '10'){zoom = 13.0;}if(Sdis == '2'){zoom = 15.0;}

    final center = await getUserLocation();
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: zoom)));

    void iterateMapEntry(key, value) {
      Place p = value;
      bool siencontrotipo=false;
      for(int i=0;i<p.tiposgas.length;i++){
        String tipo = p.tiposgas[i];
        if(StipoGas == tipo){siencontrotipo = true; i = p.prices.length;}
      }
      //MODIFICAR
      if(((siencontrotipo)||("All" == StipoGas))&(calcularDistancia22(lat,lng,p.latitude,p.longitude,Sdis))){
        initMarker22(p);
      }
    }
    if(markerMap != null){
      markerMap.forEach(iterateMapEntry);
    }

  }

  initMarker22(Place place) {
    GoogleMapController mapController2 = mapController;
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
    });
  }

  bool calcularDistancia22(double lat1, double lg1, double lat2, double lg2, String distancia){
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
        title: new Text("GoFast Bencineras",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.047),),
        backgroundColor: PrimaryColor ,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child:  IconButton(
              iconSize: 30,
              icon: Icon(Icons.refresh),
              tooltip: 'Actualizar',
              onPressed: (){
                //mapController.clearMarkers();
                //Navigator.pushReplacementNamed(context, "/App");
                BotonActualizar();
              },
            ),
          ),

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
              accountName: new Text('Vehiculo:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              accountEmail : Text( NameVehiculo,
                style: TextStyle(
                  fontSize: 17,
                ),),),
            new ListTile(
              title: new Text('Registrar Vehiculo'),
              trailing: new Icon(Icons.directions_car),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new  Registrarse(Marcasdecarros: Marcasdecarros,)));
              },
            ),
            new ListTile(
              title: new Text("Opciones"),
              trailing: new Icon(Icons.build),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new opciones(mapController: mapController,place: placed,)));//Modificacion
              },
            ),
            /* new ListTile(
              title: new Text("Favoritos"),
              trailing: new Icon(Icons.star),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => favoritos(),
                ),
                );
              },
            ),*/
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
                Navigator.pushReplacementNamed(context, "/intro");
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