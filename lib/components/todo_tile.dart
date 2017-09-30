import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/models.dart';

class TodoTile extends StatelessWidget {
  final Key key;
  final TodoTapFunction onTap;
  final Todo todo;

  final TextStyle completedTextStyle = new TextStyle(
    decoration: new TextDecoration.combine([
      TextDecoration.lineThrough,
    ]),
  );

  TodoTile({
    @required this.key,
    @required this.onTap,
    @required this.todo,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        todo.text,
        style: todo.completed ? completedTextStyle : null,
      ),
      onTap: () => onTap(todo.id),
    );
  }
}
