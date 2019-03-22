import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Marca {
  final String title;
  // Icono

  Marca(this.title);
}

class Markers extends StatefulWidget {
  @override
  _MarkersState createState() => new _MarkersState();
}

class _MarkersState extends State<Markers> {
  @override
  Widget build(BuildContext context) {
    return  RandomWords();

  }
}
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  var y = 19;
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height *0.7,
      child: Elementos(

        marca: List.generate(
          y,
              (i) => Marca('Marca $i'),
        ),
      ),

    );
  }


}

class Elementos extends StatelessWidget {
  final List<Marca> marca;

  Elementos({Key key, @required this.marca}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        itemCount: marca.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(marca[index].title),
            leading: Image.asset('assets/images/icono_gas.png',height: 50),

            onTap: () {

            },
          );
        },
      ),
    );
  }
}


