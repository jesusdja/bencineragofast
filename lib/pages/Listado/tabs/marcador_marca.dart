import 'dart:async';

import 'package:bencineragofast/api/services.dart';
import 'package:bencineragofast/main.dart';
import 'package:bencineragofast/pages/Home/place.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Listado/Details_markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recase/recase.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' as math64;
import 'package:location/location.dart' as LocationManager;

class marcador_marca extends StatefulWidget {

  marcador_marca({this.mapController,this.markerMap,this.controller,this.kmActual,this.MelatLng,this.TipoGasActual});

  final Map<String,Place> markerMap;
  final GoogleMapController mapController;
  final TabController controller;
  final String kmActual;
  final LatLng MelatLng;
  final String TipoGasActual;

  @override
  _displayState createState() => new _displayState();
}

class _displayState extends State<marcador_marca> {

  Map<String,Place> markerMap;
  List<Place> places = new List<Place>();
  var db;
  String kmActual;
  String TipoGasActual;
  LatLng MelatLng;
  services Servicios = new services();

  @override
  void initState() {

    db = new DatabaseHelper();
    kmActual = widget.kmActual;
    MelatLng = widget.MelatLng;
    TipoGasActual = widget.TipoGasActual;

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

    /*User u = await db.getUser();
    setState(() {
      kmActual = u.botonDisGas;
      TipoGasActual = u.botonTipoGas;
    });*/

    markerMap = widget.markerMap;
    Future iterateMapEntry(key, value) {
      Place p = value;
      double d = calcularDistancia(p.latitude,p.longitude);
      bool siencontrotipo=false;
      if(kmActual != null){
        siencontrotipo=false;
        for(int i=0;i<p.tiposgas.length;i++){
          String tipo = p.tiposgas[i];
          if(TipoGasActual == tipo){ siencontrotipo = true;i = p.prices.length;}
        }
        if(TipoGasActual == 'All'){siencontrotipo = true;}

        if((double.parse('$kmActual') > d)&(siencontrotipo)){
          places.add(p);
        }
      }
    }
    markerMap.forEach(iterateMapEntry);

    List<Place> places_total = places;
    List<Place> places_ordenado = new List<Place>();
    List<String> lista_tipo_marcas = new List<String>();
    lista_tipo_marcas = Servicios.extraerNombresMarcas();
    /*lista_tipo_marcas.add('SHELL');
    lista_tipo_marcas.add('PETROBRAS');
    lista_tipo_marcas.add('COPEC');*/
    places_total = places;
    for(int i = 0; i < lista_tipo_marcas.length; i++){
      int niubnijni = 0;
      for(int j = 0; j < places_total.length; j++){
        if(lista_tipo_marcas[i] == places_total[j].marca){
          if(niubnijni == 0){
            LatLng latlo = LatLng(8.270346,-62.7579366);
            List<String> precios = new List<String>();precios.add('800');precios.add('600');precios.add('900');
            List<String> tipogas = new List<String>();tipogas.add('91');tipogas.add('95');tipogas.add('93');
            List<String> Servicios = new List<String>(); Servicios.add('SERVICIO 1');Servicios.add('SERVICIO 2');
            Place placed = Place(id: 1,address: 'Dirección 1', latLng: latlo ,brand: lista_tipo_marcas[i],prices: precios,tiposgas: tipogas,last_price_update: '50000000',services: Servicios,  marca: '0202',favorito: false,OpenHr: '0.0',image: " ");
            places_ordenado.add(placed);

            niubnijni++;
          }
          places_ordenado.add(places_total[j]);
        }
      }
    }
    places = places_ordenado;       //MODIFICAR
  }
  verificar() {
    if (places.length == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('No hay Bencineras Cercas'),
          Center(

            child: Icon(
              Icons.directions_car,
              size: 120,
              color: Colors.grey[300],
            ),

          ),
        ],
      );
    } else {
      return  ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {

          if(places[index].marca != '0202'){
            String iconoName = places[index].image + 'gim';
            return ListTile(
              title: Text(ModificarCamel(places[index].marca) + ' - ' + places[index].OpenHr),
              subtitle: Text(places[index].address),//MODIFICAR
              leading: Image.asset('assets/images/brand_icons/$iconoName.png',height: 50,width: 50,),
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
          }else{
            return Container(
              color: PrimaryColor,
              child: Text(ModificarCamel(places[index].brand),textAlign: TextAlign.center,style: TextStyle(height: 1.5,fontSize: 20,color: Colors.white),),
              //subtitle: Text(places[index].marca),//MODIFICAR
            );
          }
        },
      );

    }
  }
  ModificarCamel(String cadena) {
    ReCase rc = ReCase(cadena);
    String ret;
    ret =  rc.titleCase.toString();
    return ret;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:verificar(),
    );
  }
}