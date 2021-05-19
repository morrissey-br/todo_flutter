import 'package:todo_flutter/model/Todo.dart';
import 'package:uuid/uuid.dart';

class TodoGroup {
  String id;
  String title;
  int color;
  List<Todo> todos;

  TodoGroup._({this.id, this.title, this.color, this.todos});

  static TodoGroup create({String title, int color}) {
    return TodoGroup._(id: Uuid().v1(), title: title, color: color, todos: []);
  }

  add(Todo aTodo) {
    todos.add(aTodo);
  }

  remove(Todo aTodo) {
    todos.removeWhere((todo) => todo.id == aTodo.id);
  }

  reorderTodo(int oldIndex, int newIndex) {
    Todo changingTodo = todos[oldIndex];
    todos.removeAt(oldIndex);
    todos.insert(newIndex, changingTodo);
  }
}
