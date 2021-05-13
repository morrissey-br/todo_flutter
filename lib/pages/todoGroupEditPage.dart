import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class TodoGroupEditPage extends StatefulWidget {
  final TodoGroup todoGroup;

  const TodoGroupEditPage({Key key, this.todoGroup}) : super(key: key);
  @override
  _TodoGroupEditPageState createState() => _TodoGroupEditPageState();
}

class _TodoGroupEditPageState extends State<TodoGroupEditPage> {
  TodoGroup todoGroup;

  @override
  void initState() {
    todoGroup = widget.todoGroup;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar grupo:'),
        toolbarHeight: 75,
      ),
      body: ListView(
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
        ],
      ),
    );
  }
}
