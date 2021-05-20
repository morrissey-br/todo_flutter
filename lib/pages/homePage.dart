import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoGroupComponent.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'dart:async';

import '../components/addTodoGroupAlert.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoGroup> todoGroup;

  @override
  initState() {
    todoGroup = userServices.getAllTodoGroups();
    super.initState();
  }

  Future<void> _abrirCardDeAdicao() {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AddTodoGroupAlert(
          doneCallBack: (String text) {
            userServices.addTodoGroup(title: text, color: Colors.black.value);
            setState(() {
              todoGroup = userServices.getAllTodoGroups();
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text('Hello.'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (BuildContext context) => TodoGroupEdit()),
              // );
            },
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
        },
      ),
    );
  }
}
