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
    todoLists.add(TodoList.create(
      title: 'Groceries',
      color: Colors.orange.value,
    ));
    todoLists.add(TodoList.create(
      title: 'Work',
      color: Colors.purple.value,
    ));
    todoLists.add(TodoList.create(
      title: 'Todo',
      color: Colors.blue.value,
    ));

    // todoLists[2].add(Todo.create('Diner with Carol'));
    // todoLists[2].add(Todo.create('Second Todo'));
    // todoLists[2].add(Todo.create('Third Todo'));
    // todoLists[1].add(Todo.create('Fourth Todo'));
    // todoLists[1].add(Todo.create('Fifth Todo'));
    // todoLists[1].add(Todo.create('Sixth Todo'));

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backwardsCompatibility: false,
          title: Text(widget.title),
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          backgroundColor: Colors.transparent,
          toolbarHeight: 75,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: todoLists.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: TodoListComponent(
                  todoList: todoLists[index],
                ),
              );
            }));
  }
}
