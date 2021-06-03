import 'package:todo_flutter/database/MemoryTodoGroupsDatabase.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/model/TodoGroupRepository.dart';
import 'package:todo_flutter/model/Todo.dart';

class UserServices {
  TodoGroupRepository _todoGroupRepository = MemoryTodoGroupsDatabase();

  UserServices._();

  static UserServices instance() {
    return UserServices._();
  }

  void addTodoGroup({required String title, required int color}) {
    TodoGroup aTodoGroup = TodoGroup.create(title: title, color: color);
    _todoGroupRepository.add(aTodoGroup);
  }

  TodoGroup getTodoGroupByID(String aTodoGroupID) {
    return _todoGroupRepository.getByID(aTodoGroupID);
  }

  List<TodoGroup> getAllTodoGroups() {
    return _todoGroupRepository.getAll();
  }

  void addTodoToGroup({required String todoGroupID, required String todoText}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    Todo aTodo = Todo.create(text: todoText);
    aTodoGroup.add(aTodo);
  }

  void reorderTodoOnGroup(
      {required String todoGroupID,
      required String todoID,
      required int newTodoPosition}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.reorderTodo(todoID: todoID, newTodoPosition: newTodoPosition);
  }

  void changeTodoGroupTitle(
      {required String todoGroupID, required String newTitle}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.changeTodoGroupTitle(newTitle: newTitle);
  }

  void changeTodoGroupColor(
      {required String todoGroupID, required int newColor}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.changeTodoGroupColor(newColor: newColor);
  }

  void markTodoState({required String todoGroupID, required String todoID}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.todos.firstWhere((todo) => todo.id == todoID).changeStatus();
  }

  void deleteTodoOnGroup(
      {required String todoGroupID, required String todoID}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    Todo aTodo = aTodoGroup.getTodoByID(todoID);
    aTodoGroup.remove(aTodo);
  }
}
