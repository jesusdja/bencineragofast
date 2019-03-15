import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

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
  var y = 12;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TodosScreen(
        todos: List.generate(
          y,
              (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
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
    return Scaffold(

      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // Cuando un usuario pulsa en el ListTile, navega al DetailScreen.
            // Tenga en cuenta que no solo estamos creando un DetailScreen,
            // también le pasamos el objeto Todo actual!
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  // Declara un campo que contenga el objeto Todo
  final Todo todo;

  // En el constructor, se requiere un objeto Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}
