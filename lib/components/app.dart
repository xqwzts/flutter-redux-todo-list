import 'package:flutter/material.dart';
import 'package:todo/components/footer.dart';
import 'package:todo/containers/add_todo.dart';
import 'package:todo/containers/visible_todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Flutter Todos'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new AddTodo(),
            new VisibleTodoList(),
            new Footer(),
          ],
        ),
      ),
    );
  }
}
