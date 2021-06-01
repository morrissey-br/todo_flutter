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

  void add(Todo aTodo) {
    todos.add(aTodo);
  }

  void remove(Todo aTodo) {
    todos.removeWhere((todo) => todo.id == aTodo.id);
  }

  reorderTodo({String todoID, int newTodoPosition}) {
    Todo changingPositionTodo = todos.firstWhere((todo) => todo.id == todoID);
    todos.removeWhere((todo) => todo.id == todoID);
    todos.insert(newTodoPosition - 1, changingPositionTodo);
  }
}
