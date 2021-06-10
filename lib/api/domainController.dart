import 'package:todo_flutter/core/gateways/DBContext.dart';
import 'package:todo_flutter/core/gateways/IDGenerator.dart';
import 'package:todo_flutter/core/services/TodoGroupManager.dart';

class DomainController {
  TodoGroupManager _todoGroupManager;

  DomainController._(this._todoGroupManager);

  static DomainController instantiate(
      DBContext dbContext, IDGenerator idGenerator) {
    TodoGroupManager todoGroupManager =
        TodoGroupManager.instantiate(dbContext, idGenerator);
    return DomainController._(todoGroupManager);
  }

  void createNewTodoGroup({required String title, required int color}) {
    _todoGroupManager.createNewTodoGroup(title: title, color: color);
  }

  void deleteTodoGroupByID({required String id}) {
    _todoGroupManager.deleteTodoGroupByID(id: id);
  }

  void changeTodoGroupTitle(
      {required String todoGroupID, required String newTitle}) {
    _todoGroupManager.changeTodoGroupTitle(
        todoGroupID: todoGroupID, newTitle: newTitle);
  }

  void changeTodoGroupColor(
      {required String todoGroupID, required int newColor}) {
    _todoGroupManager.changeTodoGroupColor(
        todoGroupID: todoGroupID, newColor: newColor);
  }

  void createNewTodoOnGroup(
      {required String todoGroupID, required String text}) {
    _todoGroupManager.createNewTodoOnGroup(
        todoGroupID: todoGroupID, text: text);
  }

  void deleteTodoOnGroup(
      {required String todoGroupID, required String todoID}) {
    _todoGroupManager.deleteTodoOnGroup(
        todoGroupID: todoGroupID, todoID: todoID);
  }

  void changeTodoStatus({required String todoGroupID, required String todoID}) {
    _todoGroupManager.changeTodoStatus(
        todoGroupID: todoGroupID, todoID: todoID);
  }

  void reorderTodoOnGroup(
      {required String todoGroupID,
      required String todoID,
      required int newTodoPosition}) {
    _todoGroupManager.reorderTodoOnGroup(
        todoGroupID: todoGroupID,
        todoID: todoID,
        newTodoPosition: newTodoPosition);
  }

  // TodoGroup getTodoGroupByID(String aTodoGroupID) {
  //   return _todoGroupRepository.getByID(aTodoGroupID);
  // }

  // List<TodoGroup> getAllTodoGroups() {
  //   return _todoGroupRepository.getAll();
  // }

  // void addTodoToGroup({required String todoGroupID, required String todoText}) {
  //   TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
  //   Todo aTodo = Todo.create(text: todoText);
  //   aTodoGroup.add(aTodo);
  // }

  // void reorderTodoOnGroup(
  //     {required String todoGroupID,
  //     required String todoID,
  //     required int newTodoPosition}) {
  //   TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
  //   aTodoGroup.reorderTodo(todoID: todoID, newTodoPosition: newTodoPosition);
  // }

  // void markTodoState({required String todoGroupID, required String todoID}) {
  //   TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
  //   aTodoGroup.todos.firstWhere((todo) => todo.id == todoID).changeStatus();
  // }

  // void deleteTodoOnGroup(
  //     {required String todoGroupID, required String todoID}) {
  //   TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
  //   Todo aTodo = aTodoGroup.getTodoByID(todoID);
  //   aTodoGroup.remove(aTodo);
  // }
}
