import 'package:flutter/material.dart';
import 'package:todo_flutter/model/todoList.dart';

class TodoListComponent extends StatefulWidget {
  final TodoList todoList;

  const TodoListComponent({Key key, this.todoList}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoListComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.todoList.title,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.todoList.todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(widget.todoList.todos[index].text);
            }),
      ],
    );
  }
}
