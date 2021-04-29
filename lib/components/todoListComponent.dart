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
  bool isOpen = false;

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
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.todoList.todos.length > 0) {
                      isOpen = !isOpen;
                      debugPrint(isOpen.toString());
                    }
                  });
                },
                child: Row(
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
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.decelerate,
                height: this.isOpen
                    ? null
                    : 0, // FIXME: Sair de null para 0 não tem animação!
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.todoList.todos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TodoComponent(
                              todo: widget.todoList.todos[index],
                              color: widget.todoList.color,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
