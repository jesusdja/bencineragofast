import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class display extends StatefulWidget {
  @override
  _displayState createState() => new _displayState();
}

class _displayState extends State<display> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       body: RandomWords(),

    );
  }
}
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    final _isSaved = _saved.contains(pair);

    return new ListTile(
      onTap: () {
        setState(() {
          _isSaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        _isSaved ? Icons.favorite : Icons.favorite_border,
        color: _isSaved ? Colors.red : null,
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;

        if (index >= _suggestions.length)
          _suggestions.addAll(generateWordPairs().take(10));

        return _buildRow(_suggestions[index]);
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        final _tiles = ListTile
            .divideTiles(
          context: context,
          tiles: _saved.map((pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          }),
        )
            .toList();

        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Names'),
          ),
          body: new ListView(children: _tiles),
        );
      }),
    );
  }
}
