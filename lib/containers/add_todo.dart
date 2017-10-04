import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/models.dart';
import 'package:todo/redux/actions.dart';

class _ViewModel {
  final AddTodoPressedFunction onAddPressed;

  _ViewModel({
    @required this.onAddPressed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => new _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TodoState, _ViewModel>(
      distinct: true,
      converter: (store) => new _ViewModel(
            onAddPressed: (todoText) => store.dispatch(
                  new AddTodoAction(text: todoText),
                ),
          ),
      builder: (context, viewModel) => new TextField(
            controller: _controller,
            decoration: new InputDecoration(labelText: 'Add todo'),
            onSubmitted: (todoText) {
              viewModel.onAddPressed(todoText);
              _controller.text = '';
            },
          ),
    );
  }
}
