import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoGroupComponent.dart';
import 'package:todo_flutter/database/MemoryTodoGroupsDatabase.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoGroup> todoGroup;

  @override
  Widget build(BuildContext context) {
    todoGroup = MemoryTodoGroupsDatabase().getAll();

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
            itemCount: todoGroup.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: TodoGroupComponent(
                  todoGroup: todoGroup[index],
                ),
              );
            }));
  }
}
