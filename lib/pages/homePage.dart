import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todoGroupComponent.dart';
import 'package:todo_flutter/pages/appConfigurationPage.dart';
import 'package:todo_flutter/api/dtos/TodoGroupDTO.dart';
import 'dart:async';

import '../components/addTodoGroupAlert.dart';
import '../main.dart';

// TODO: Criar página que explica o app (depois do lançamento do beta)
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoGroupDTO> todoGroups = [];

  @override
  void initState() {
    domainPresenter.getAllTodoGroups().then((todoGroupsDTOs) {
      setState(() {
        todoGroups = todoGroupsDTOs;
      });
    });
    super.initState();
  }

  Future<void> _updateState() async {
    final todoGroupsDTOs = await domainPresenter.getAllTodoGroups();
    setState(() {
      todoGroups = todoGroupsDTOs;
    });
  }

  Future<void> _abrirCardDeAdicao() {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AddTodoGroupAlert(
          doneCallBack: (String text) async {
            await domainController.createNewTodoGroup(
                title: text, color: Colors.blue.value);
            await _updateState();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Future<void> _onTodoClick(
      {required String todoGroupID, required String todoID}) async {
    await domainController.changeTodoStatus(
        todoGroupID: todoGroupID, todoID: todoID);
    await _updateState();
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AppConfigurationPage()),
              );
            },
            iconSize: Theme.of(context).iconTheme.size ?? 24,
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _abrirCardDeAdicao();
            },
            iconSize: Theme.of(context).iconTheme.size ?? 24,
            padding: EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        itemCount: todoGroups.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return TodoGroupComponent(
            index: index,
            todoGroup: todoGroups[index],
            isLast: index == todoGroups.length - 1 ? true : false,
            onTodoClick: (
                {required String todoGroupID, required String todoID}) async {
              await _onTodoClick(todoGroupID: todoGroupID, todoID: todoID);
            },
            onEditReturn: () async {
              await _updateState();
            },
          );
        },
      ),
    );
  }
}
