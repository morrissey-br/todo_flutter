import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoListComponent.dart';
import 'package:todo_flutter/model/todoList.dart';

import 'model/todo.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoList> todoLists;

  @override
  Widget build(BuildContext context) {
    todoLists = [];
    todoLists.add(TodoList.create('First Todo List'));
    todoLists.add(TodoList.create('Second Todo List'));

    todoLists[0].add(Todo.create('First Todo'));
    todoLists[0].add(Todo.create('Second Todo'));
    todoLists[0].add(Todo.create('Third Todo'));
    todoLists[1].add(Todo.create('Fourth Todo'));
    todoLists[1].add(Todo.create('Fifth Todo'));
    todoLists[1].add(Todo.create('Sixth Todo'));

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: todoLists.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoListComponent(
                todoList: todoLists[index],
              );
            }));
  }
}
