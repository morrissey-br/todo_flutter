import 'package:flutter/material.dart';
import 'package:todo_flutter/model/todo.dart';

class TodoComponent extends StatefulWidget {
  final Todo todo;
  final int color;

  const TodoComponent({Key key, this.todo, this.color}) : super(key: key);

  @override
  _TodoComponentState createState() => _TodoComponentState();
}

class _TodoComponentState extends State<TodoComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.horizontal_rule,
              color: Color(widget.color),
            ),
          ),
          Text(widget.todo.text),
        ],
      ),
    );
  }
}
