import 'package:flutter/foundation.dart';

enum VisibilityFilter { SHOW_ALL, SHOW_ACTIVE, SHOW_COMPLETED }

class Todo {
  final int id;
  final String text;
  final bool completed;

  const Todo({
    @required this.id,
    @required this.text,
    this.completed = false,
  });

  Todo copyWith({int id, String text, bool completed}) {
    return new Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
    );
  }
}

class TodoState {
  final List<Todo> todos;
  final VisibilityFilter visibilityFilter;

  const TodoState({
    @required this.todos,
    @required this.visibilityFilter,
  });

  TodoState.initialState()
      : todos = <Todo>[],
        visibilityFilter = VisibilityFilter.SHOW_ALL;
}

typedef void TodoTapFunction(int id);

typedef void AddTodoPressedFunction(String text);

typedef void SetVisibilityFilterFunction(VisibilityFilter filter);
