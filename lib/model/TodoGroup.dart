import 'package:todo_flutter/model/Todo.dart';
import 'package:uuid/uuid.dart';

class TodoGroup {
  String id;
  String title;
  int color;
  List<Todo> todos;

  TodoGroup._(
      {required this.id,
      required this.title,
      required this.color,
      required this.todos});

  static TodoGroup create({required String title, required int color}) {
    return TodoGroup._(id: Uuid().v1(), title: title, color: color, todos: []);
  }

  void add(Todo aTodo) {
    todos.add(aTodo);
  }

  void remove(Todo aTodo) {
    todos.removeWhere((todo) => todo.id == aTodo.id);
  }

  void reorderTodo({required String todoID, required int newTodoPosition}) {
    Todo changingPositionTodo = todos.firstWhere((todo) => todo.id == todoID);
    todos.removeWhere((todo) => todo.id == todoID);
    todos.insert(newTodoPosition - 1, changingPositionTodo);
  }

  void changeTodoGroupTitle({required String newTitle}) {
    title = newTitle;
  }

  void changeTodoGroupColor({required int newColor}) {
    color = newColor;
  }
}
