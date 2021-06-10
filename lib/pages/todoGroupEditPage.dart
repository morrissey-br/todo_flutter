import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_flutter/components/addTodoAlert.dart';
import 'package:todo_flutter/components/changeTodoGroupColorAlert.dart';
import 'package:todo_flutter/components/changeTodoGroupTitleAlert.dart';
import 'package:todo_flutter/components/confirmDeleteTodoAlert.dart';
import 'package:todo_flutter/main.dart';
import 'package:todo_flutter/api/dtos/TodoGroupDTO.dart';

class TodoGroupEditPage extends StatefulWidget {
  final String todoGroupID;

  TodoGroupEditPage({Key? key, required this.todoGroupID}) : super(key: key);
  @override
  _TodoGroupEditPageState createState() => _TodoGroupEditPageState();
}

class _TodoGroupEditPageState extends State<TodoGroupEditPage> {
  late TodoGroupDTO todoGroup;

  @override
  void initState() {
    todoGroup = domainPresenter.getTodoGroupByID(widget.todoGroupID);
    super.initState();
  }

  void _updateState() {
    setState(() {
      todoGroup = domainPresenter.getTodoGroupByID(widget.todoGroupID);
    });
  }

  void reorderTodo(int oldIndex, int newIndex) {
    var aTodo = todoGroup.todos[oldIndex];
    domainController.reorderTodoOnGroup(
        todoGroupID: todoGroup.id,
        todoID: aTodo.id,
        newTodoPosition: oldIndex > newIndex ? newIndex + 1 : newIndex);
    _updateState();
  }

  Future<void> openAddTodoAlert() {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AddTodoAlert(
          doneCallBack: (String text) {
            domainController.createNewTodoOnGroup(
                todoGroupID: widget.todoGroupID, text: text);
            _updateState();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Future<void> openDeleteTodoAlert({required String todoID}) {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return ConfirmDeleteTodoAlert(doneCallBack: ({required bool confirm}) {
          if (confirm) {
            domainController.deleteTodoOnGroup(
                todoGroupID: todoGroup.id, todoID: todoID);
            _updateState();
          }
          Navigator.of(context).pop();
        });
      },
    );
  }

  Future<void> openChangeTodoGroupTitleAlert() {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return ChangeTodoGroupTitleAlert(
          todoTitle: todoGroup.title,
          doneCallBack: (String text) {
            domainController.changeTodoGroupTitle(
                todoGroupID: widget.todoGroupID, newTitle: text);
            _updateState();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Future<void> openChangeTodoGroupColorAlert() {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return ChangeTodoGroupColorAlert(
          todoColor: todoGroup.color,
          doneCallBack: ({required int newColor}) {
            domainController.changeTodoGroupColor(
                todoGroupID: widget.todoGroupID, newColor: newColor);
            _updateState();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar grupo'),
        toolbarHeight: 75,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Dados do grupo',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.title),
                  title: Text('Título'),
                  subtitle: Text(todoGroup.title),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    openChangeTodoGroupTitleAlert();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('Cor'),
                  subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.circle,
                      color: Color(todoGroup.color),
                      size: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    openChangeTodoGroupColorAlert();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Todos',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text('Segure e arraste para reordenar'),
                    trailing: Icon(Icons.add),
                    onTap: () {
                      openAddTodoAlert();
                    },
                  ),
                  Divider(),
                  Expanded(
                    child: ReorderableListView.builder(
                      onReorder: (int oldIndex, int newIndex) {
                        reorderTodo(oldIndex, newIndex);
                      },
                      itemCount: todoGroup.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          key: ValueKey(index),
                          title: Text(todoGroup.todos[index].text),
                          trailing: Icon(Icons.close),
                          onTap: () {
                            openDeleteTodoAlert(
                                todoID: todoGroup.todos[index].id);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
