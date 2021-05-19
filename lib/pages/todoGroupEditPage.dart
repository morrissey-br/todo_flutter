import 'package:flutter/material.dart';
import 'package:todo_flutter/model/TodoGroup.dart';

class TodoGroupEditPage extends StatefulWidget {
  final TodoGroup todoGroup;

  TodoGroupEditPage({Key key, this.todoGroup}) : super(key: key);
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

  void reorderTodo(int oldIndex, int newIndex) {
    oldIndex > newIndex
        ? todoGroup.reorderTodo(oldIndex, newIndex)
        : todoGroup.reorderTodo(oldIndex, newIndex - 1);
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
