import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_flutter/components/addTodoAlert.dart';
import 'package:todo_flutter/main.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class TodoGroupEditPage extends StatefulWidget {
  final String todoGroupID;

  TodoGroupEditPage({Key key, this.todoGroupID}) : super(key: key);
  @override
  _TodoGroupEditPageState createState() => _TodoGroupEditPageState();
}

class _TodoGroupEditPageState extends State<TodoGroupEditPage> {
  TodoGroup todoGroup;

  @override
  void initState() {
    todoGroup = userServices.getTodoGroupByID(widget.todoGroupID);
    super.initState();
  }

  void reorderTodo(int oldIndex, int newIndex) {
    var aTodo = todoGroup.todos[oldIndex];
    todoGroup.reorderTodo(
        todoID: aTodo.id,
        newTodoPosition: oldIndex > newIndex ? newIndex + 1 : newIndex);
  }

  Future<void> openAddTodoCard() {
    return showDialog(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AddTodoAlert(
          doneCallBack: (String text) {
            userServices.addTodoToGroup(
                todoGroupID: widget.todoGroupID, todoText: text);
            setState(() {
              todoGroup = userServices.getTodoGroupByID(widget.todoGroupID);
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
      appBar: AppBar(
        title: Text('Editar grupo:'),
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
                  onTap: () {},
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
                  onTap: () {},
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
                    trailing: Icon(Icons.add),
                    onTap: () {
                      openAddTodoCard();
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
                          trailing: Icon(Icons.drag_indicator),
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
