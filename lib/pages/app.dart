import 'package:bencineragofast/pages/BotonesHome/bloc_provider.dart';
import 'package:bencineragofast/pages/BotonesHome/group_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bencineragofast/pages/Home/mapaHome.dart';
import 'package:bencineragofast/pages/BotonesHome/task_bloc.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AppBar appBar = new AppBar(title: new Text("Tip Calculator"));


    return new Scaffold(

      body: Stack(
        children: <Widget>[
          mapaHomePage(),
        ]
      )
    );
    /*return BlocProvider<GroupBloc>(
      bloc: GroupBloc(),
      child: BlocProvider<TaskBloc>(
        bloc: TaskBloc(),
        child: mapaHomePage(),
      ),
    );*/
  }
}