import 'package:bencineragofast/pages/Home/place.dart';
import 'package:bencineragofast/pages/Menu/Data/DATACOPIA.dart';
import 'package:bencineragofast/pages/sqlflite/User.dart';
import 'package:bencineragofast/pages/sqlflite/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Listado/tabs/marcador_distancia.dart';
import 'package:bencineragofast/pages/Listado/tabs/marcador_marca.dart';
import 'package:bencineragofast/pages/Listado/tabs/marcador_favoritos.dart';
import 'package:bencineragofast/pages/Listado/tabs/marcador_precio.dart';
import 'package:bencineragofast/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListadoGasolineras extends StatefulWidget {

  ListadoGasolineras({this.mapController,this.markerMap,this.MelatLng,this.kmActual});

  final Map<String,Place> markerMap;
  final GoogleMapController mapController;
  final LatLng MelatLng;
  final String kmActual;

  @override
  _ListadoGasolinerasState createState() => new _ListadoGasolinerasState();
}


class _ListadoGasolinerasState extends State<ListadoGasolineras> with SingleTickerProviderStateMixin{
  TabController _controller;
  var db;
  String kmActual;
  String tipoGasActual;
  LatLng MelatLng;
  User u;

  TraerUsuario() async {
    db = new DatabaseHelper();
    User u = await db.getUser();
    setState((){
      kmActual = u.botonDisGas;
      tipoGasActual = u.botonTipoGas;
    });
  }

  @override
  Future initState() {
    _controller = TabController(length: 4, vsync: this );
    MelatLng = widget.MelatLng;
    TraerUsuario();
    super.initState();
  }
  void dispose(){
    _controller.dispose();
    TraerUsuario();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: PrimaryColor,
        title: new Text('Distancia maxima $kmActual Km'),
        bottom: getTabBar(),
      ),
      body: getTabBarView(),
    );

  }
  TabBar getTabBar(){
    return TabBar(
      tabs: <Tab>[
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.bookmark)),
        Tab(icon: Icon(Icons.attach_money)),
        Tab(icon: Icon(Icons.star)),
      ],
      controller: _controller,
    );
  }

  TabBarView getTabBarView(){
    return TabBarView(
      children: <Widget>[
        marcador_distancia(mapController: widget.mapController, markerMap: widget.markerMap,kmActual: kmActual,tiposGasActual: tipoGasActual,MelatLng: MelatLng,),
        marcador_marca(mapController: widget.mapController, markerMap: widget.markerMap,kmActual: kmActual,MelatLng: MelatLng,TipoGasActual: tipoGasActual,),
        marcador_precio(mapController: widget.mapController, markerMap: widget.markerMap,kmActual: kmActual,MelatLng: MelatLng,tgActual: tipoGasActual,),
        marcador_fav(mapController: widget.mapController, markerMap: widget.markerMap,kmActual: kmActual,MelatLng: MelatLng,),
      ],
      controller: _controller,
    );
  }


}
