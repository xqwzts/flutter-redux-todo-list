import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/components/todo_list.dart';
import 'package:todo/models.dart';
import 'package:todo/redux/actions.dart';

class _ViewModel {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  _ViewModel({
    this.todos,
    this.onTodoTap,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              new ListEquality<Todo>().equals(todos, other.todos);

  @override
  int get hashCode => todos.hashCode;
}

class VisibleTodoList extends StatelessWidget {
  List<Todo> _getVisibleTodos(List<Todo> todos, VisibilityFilter filter) {
    switch (filter) {
      case VisibilityFilter.SHOW_ALL:
        return todos;
      case VisibilityFilter.SHOW_COMPLETED:
        return todos.where((todo) => todo.completed).toList();
      case VisibilityFilter.SHOW_ACTIVE:
        return todos.where((todo) => !todo.completed).toList();
      default:
        return <Todo>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<TodoState, _ViewModel>(
      distinct: true,
      converter: (store) => new _ViewModel(
            todos: _getVisibleTodos(
                store.state.todos, store.state.visibilityFilter),
            onTodoTap: (id) => store.dispatch(
                  new ToggleTodoAction(id: id),
                ),
          ),
      builder: (context, viewModel) => new TodoList(
            todos: viewModel.todos,
            onTodoTap: viewModel.onTodoTap,
          ),
    );
  }
}
