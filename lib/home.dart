import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoGroupComponent.dart';
import 'package:todo_flutter/database/MemoryTodoGroupsDatabase.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/model/TodoGroupRepository.dart';

import 'components/addTodoGroupAlert.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  final TodoGroupRepository todoGroupRepository = MemoryTodoGroupsDatabase();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoGroup> todoGroup;

  Future<void> _abrirCardDeAdicao() async {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AddTodoGroupAlert(
          doneCallBack: (String text) {
            TodoGroup newTodoGroup =
                TodoGroup.create(color: Colors.black.value, title: text);
            widget.todoGroupRepository.add(newTodoGroup);
            setState(() {
              todoGroup = widget.todoGroupRepository.getAll();
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    todoGroup = widget.todoGroupRepository.getAll();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 75,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              iconSize: Theme.of(context).iconTheme.size,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _abrirCardDeAdicao();
              },
              // FIXME: Colocado aqui e não no tema por conta de um bug no Flutter. #58752 já corrigidio, esperando release.
              iconSize: Theme.of(context).iconTheme.size,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 8),
            itemCount: todoGroup.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return TodoGroupComponent(
                index: index,
                todoGroup: todoGroup[index],
                isLast: index == todoGroup.length - 1 ? true : false,
              );
            }));
  }
}
