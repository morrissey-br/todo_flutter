import 'package:flutter/material.dart';
import 'package:todo_flutter/model/Todo.dart';

class TodoComponent extends StatelessWidget {
  final Todo todo;
  final int color;
  final Function onTap;

  TodoComponent({Key key, this.todo, this.color, this.onTap}) : super(key: key);

  final doneTodoTextStyle = TextStyle(
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 32),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Icon(
                todo.status ? Icons.done : Icons.horizontal_rule,
                color: Color(color),
                size: 32,
              ),
            ),
            Text(
              todo.text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(todo.status ? doneTodoTextStyle : null),
            ),
          ],
        ),
      ),
    );
  }
}
