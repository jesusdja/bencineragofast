import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Listado/tabs/display.dart';

class ListadoGasolineras extends StatefulWidget {
  @override
  _ListadoGasolinerasState createState() => new _ListadoGasolinerasState();
}


class _ListadoGasolinerasState extends State<ListadoGasolineras> with SingleTickerProviderStateMixin{
  TabController _controller;



  @override

  void initState(){
    super.initState();
    _controller = TabController(length: 4, vsync: this );
  }


  void dispose(){
    _controller.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(11,90,70,60),
        title: new Text('Bencineras '),
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
        display(),
        Center( child: Text("aqui van la lista con la marcas")),
        Center( child: Text("por precios ")),
        Center( child: Text("Lista de favoritos desde la lista principal")),

      ],
      controller: _controller,
    );
  }
}
