import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class DATACOPIA extends StatefulWidget {
  @override
  _DATACOPIAState createState() => new _DATACOPIAState();
}

class _DATACOPIAState extends State<DATACOPIA> {
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
  var y = 20;
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height,
      child: TodosScreen(

        todos: List.generate(
          y,
              (i) => Todo(
            'Todo $i',
            'A description $i',
          ),
        ),
      ),

    );
  }


}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}


