import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo/components/app.dart';
import 'package:todo/models.dart';
import 'package:todo/redux/reducers.dart';

void main() {
  runApp(new TodoApp());
}

class TodoApp extends StatelessWidget {
  final Store store =
      new Store<TodoState>(todoAppReducer, initialState: new TodoState.initialState());

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<TodoState>(
      store: store,
      child: new MaterialApp(
        title: 'todo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new App(),
      ),
    );
  }
}
