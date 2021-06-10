import 'package:todo_flutter/core/concepts/Entity.dart';
import 'package:todo_flutter/core/model/Todo.dart';

class TodoGroup extends Entity<TodoGroup> {
  String _title;
  int _color;
  List<Todo> _todos;

  TodoGroup._(String _id, this._title, this._color, this._todos) : super(_id);

  static TodoGroup create(String id, String title, int color) {
    return TodoGroup._(id, title, color, []);
  }

  static TodoGroup fromMap(Map<String, dynamic> map) {
    return TodoGroup._(map['id'], map['title'], map['color'], map['todos']);
  }

  String get title {
    return _title;
  }

  int get color {
    return _color;
  }

  List<Todo> get todos {
    return _todos;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': _title,
      'color': _color,
      'todos': _todos,
    };
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
