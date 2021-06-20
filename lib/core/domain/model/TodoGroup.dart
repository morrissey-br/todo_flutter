import 'package:todo_flutter/core/domain/concepts/Entity.dart';

import 'Todo.dart';

class TodoGroup extends Entity<TodoGroup> {
  String _title;
  int _color;
  List<Todo> _todos;

  TodoGroup.create(String id, String title, int color)
      : this._title = title,
        this._color = color,
        this._todos = [],
        super(id);

  TodoGroup.rebuild(String id, String title, int color, List<Todo> todos)
      : this._title = title,
        this._color = color,
        this._todos = todos,
        super(id);

  String get title {
    return _title;
  }

  int get color {
    return _color;
  }

  List<Todo> get todos {
    return _todos;
  }

  void add(Todo aTodo) {
    _todos.add(aTodo);
  }

  void remove(Todo aTodo) {
    _todos.removeWhere((todo) => todo.id == aTodo.id);
  }

  Todo getTodoByID(String aTodoID) {
    return _todos.firstWhere((todo) => todo.id == aTodoID);
  }

  void reorderTodo({required String todoID, required int newTodoPosition}) {
    Todo changingPositionTodo = _todos.firstWhere((todo) => todo.id == todoID);
    _todos.removeWhere((todo) => todo.id == todoID);
    _todos.insert(newTodoPosition - 1, changingPositionTodo);
  }

  void changeTitle({required String newTitle}) {
    _title = newTitle;
  }

  void changeColor({required int newColor}) {
    _color = newColor;
  }
}
