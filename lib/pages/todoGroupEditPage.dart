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

  reorderTodo(int oldIndex, int newIndex) {
    debugPrint('reorder $oldIndex $newIndex');
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
                    child: ReorderableListView(children: [
                      ListTile(
                        key: ValueKey(1),
                        title: Text('lala'),
                      ),
                      ListTile(
                        key: ValueKey(2),
                        title: Text('lala'),
                      ),
                      ListTile(
                        key: ValueKey(3),
                        title: Text('lala'),
                      ),
                      ListTile(
                        key: ValueKey(4),
                        title: Text('lala1'),
                      ),
                    ], onReorder: (oldIndex, newIndex) {}),
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
