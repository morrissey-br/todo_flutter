import 'package:todo_flutter/model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoList {
  String id;
  String title;
  List<Todo> todos;

  TodoList._(this.id, this.title, this.todos);

  static TodoList create(String title) {
    return TodoList._(Uuid().v1(), title, []);
  }

  add(Todo aTodo) {
    todos.add(aTodo);
  }

  remove(Todo aTodo) {
    todos.removeWhere((todo) => todo.id == aTodo.id);
  }
}
