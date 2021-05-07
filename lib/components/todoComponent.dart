import 'package:flutter/material.dart';
import 'package:todo_flutter/model/Todo.dart';

class TodoComponent extends StatefulWidget {
  final Todo todo;
  final int color;

  TodoComponent({Key key, this.todo, this.color}) : super(key: key);

  final doneTodoTextStyle = TextStyle(
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );

  @override
  _TodoComponentState createState() => _TodoComponentState();
}

class _TodoComponentState extends State<TodoComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 32),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Icon(
              widget.todo.status ? Icons.done : Icons.horizontal_rule,
              color: Color(widget.color),
              size: 32,
            ),
          ),
          Text(
            widget.todo.text,
            style: Theme.of(context)
                .textTheme
                .headline6
                .merge(widget.todo.status ? widget.doneTodoTextStyle : null),
          ),
        ],
      ),
    );
  }
}
