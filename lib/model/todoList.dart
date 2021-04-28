import 'package:todo_flutter/model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoList {
  String id;
  String title;
  int color;
  List<Todo> todos;

  TodoList._({this.id, this.title, this.color, this.todos});

  static TodoList create({String title, int color}) {
    return TodoList._(id: Uuid().v1(), title: title, color: color, todos: []);
  }

  add(Todo aTodo) {
    todos.add(aTodo);
  }

  remove(Todo aTodo) {
    todos.removeWhere((todo) => todo.id == aTodo.id);
  }
}
