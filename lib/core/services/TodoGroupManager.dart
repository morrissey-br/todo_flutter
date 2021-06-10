import 'package:todo_flutter/core/gateways/DBContext.dart';
import 'package:todo_flutter/core/gateways/IDGenerator.dart';
import 'package:todo_flutter/core/model/Todo.dart';
import 'package:todo_flutter/core/model/TodoGroup.dart';
import 'package:todo_flutter/core/repositories/TodoGroups.dart';

class TodoGroupManager {
  TodoGroups _todoGroups;

  TodoGroupManager._(this._todoGroups);

  static TodoGroupManager instantiate(
      DBContext dbContext, IDGenerator idGenerator) {
    TodoGroups todoGroups = TodoGroups.instantiate(dbContext, idGenerator);
    return TodoGroupManager._(todoGroups);
  }

  void createNewTodoGroup({required String title, required int color}) {
    String newID = _todoGroups.newID();
    TodoGroup newTodoGroup = TodoGroup.create(newID, title, color);
    _todoGroups.save(newTodoGroup);
  }

  void deleteTodoGroupByID({required String id}) {
    TodoGroup todoGroup = _todoGroups.getByID(id);
    _todoGroups.remove(todoGroup);
  }

  void changeTodoGroupTitle(
      {required String todoGroupID, required String newTitle}) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    todoGroup.changeTitle(newTitle: newTitle);
    _todoGroups.save(todoGroup);
  }

  void changeTodoGroupColor(
      {required String todoGroupID, required int newColor}) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    todoGroup.changeColor(newColor: newColor);
    _todoGroups.save(todoGroup);
  }

  void createNewTodoOnGroup(
      {required String todoGroupID, required String text}) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    String newID = _todoGroups.newID();
    Todo newTodo = Todo.create(id: newID, todoGroupID: todoGroupID, text: text);
    todoGroup.add(newTodo);
    _todoGroups.save(todoGroup);
  }

  deleteTodoOnGroup({required todoGroupID, required todoID}) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    Todo todo = todoGroup.getTodoByID(todoID);
    todoGroup.remove(todo);
    _todoGroups.save(todoGroup);
  }

  void changeTodoStatus({required String todoGroupID, required String todoID}) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    Todo todo = todoGroup.getTodoByID(todoID);
    todo.changeStatus();
    _todoGroups.save(todoGroup);
  }

  void reorderTodoOnGroup(
      {required String todoGroupID,
      required String todoID,
      required int newTodoPosition}) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    todoGroup.reorderTodo(todoID: todoID, newTodoPosition: newTodoPosition);
    _todoGroups.save(todoGroup);
  }
}
