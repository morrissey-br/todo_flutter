import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoComponent.dart';
import 'package:todo_flutter/model/todo.dart';
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
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.grey.shade300,
                offset: Offset(0, -1),
              )
            ],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      widget.todoList.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Color(widget.todoList.color)),
                    ),
                  ),
                ],
              ),
              // TODO: COMENTADO ABAIXO ESTÁ O WIDGET QUE CONTEM OS TODOS, ESSE WIDGET PRECISA SER COLAPSÁVEL
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(vertical: 16),
              //         child: ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: widget.todoList.todos.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return TodoComponent(
              //               todo: widget.todoList.todos[index],
              //               color: widget.todoList.color,
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
