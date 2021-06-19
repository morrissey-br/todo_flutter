import 'package:todo_flutter/core/domain/repositories/TodoGroupRepo.dart';
import 'package:todo_flutter/core/domain/services/TodoGroupManager.dart';

class DomainController {
  TodoGroupManager _todoGroupManager;

  DomainController._(this._todoGroupManager);

  static DomainController instantiate(TodoGroupRepo todoGroupRepo) {
    TodoGroupManager todoGroupManager = TodoGroupManager(todoGroupRepo);
    return DomainController._(todoGroupManager);
  }

  Future<void> createNewTodoGroup(
      {required String title, required int color}) async {
    await _todoGroupManager.createNewTodoGroup(title: title, color: color);
  }

  Future<void> deleteTodoGroupByID({required String id}) async {
    await _todoGroupManager.deleteTodoGroupByID(id: id);
  }

  Future<void> changeTodoGroupTitle(
      {required String todoGroupID, required String newTitle}) async {
    await _todoGroupManager.changeTodoGroupTitle(
        todoGroupID: todoGroupID, newTitle: newTitle);
  }

  Future<void> changeTodoGroupColor(
      {required String todoGroupID, required int newColor}) async {
    await _todoGroupManager.changeTodoGroupColor(
        todoGroupID: todoGroupID, newColor: newColor);
  }

  Future<void> createNewTodoOnGroup(
      {required String todoGroupID, required String text}) async {
    await _todoGroupManager.createNewTodoOnGroup(
        todoGroupID: todoGroupID, text: text);
  }

  Future<void> deleteTodoOnGroup(
      {required String todoGroupID, required String todoID}) async {
    await _todoGroupManager.deleteTodoOnGroup(
        todoGroupID: todoGroupID, todoID: todoID);
  }

  Future<void> changeTodoStatus(
      {required String todoGroupID, required String todoID}) async {
    await _todoGroupManager.changeTodoStatus(
        todoGroupID: todoGroupID, todoID: todoID);
  }

  Future<void> reorderTodoOnGroup(
      {required String todoGroupID,
      required String todoID,
      required int newTodoPosition}) async {
    await _todoGroupManager.reorderTodoOnGroup(
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
