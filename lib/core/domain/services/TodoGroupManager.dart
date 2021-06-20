import 'package:todo_flutter/core/domain/model/Todo.dart';
import 'package:todo_flutter/core/domain/model/TodoGroup.dart';
import 'package:todo_flutter/core/domain/repositories/TodoGroupRepo.dart';

class TodoGroupManager {
  TodoGroupRepo _todoGroupRepo;

  TodoGroupManager(this._todoGroupRepo);

  Future<void> createNewTodoGroup(
      {required String title, required int color}) async {
    String newID = _todoGroupRepo.newID();
    TodoGroup newTodoGroup = TodoGroup.create(newID, title, color);
    await _todoGroupRepo.save(newTodoGroup);
  }

  Future<void> deleteTodoGroupByID({required String id}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(id);
    _todoGroupRepo.remove(todoGroup);
  }

  Future<void> changeTodoGroupTitle(
      {required String todoGroupID, required String newTitle}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    todoGroup.changeTitle(newTitle: newTitle);
    await _todoGroupRepo.save(todoGroup);
  }

  Future<void> changeTodoGroupColor(
      {required String todoGroupID, required int newColor}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    todoGroup.changeColor(newColor: newColor);
    await _todoGroupRepo.save(todoGroup);
  }

  Future<void> createNewTodoOnGroup(
      {required String todoGroupID, required String text}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    String newID = _todoGroupRepo.newID();
    Todo newTodo = Todo.create(id: newID, todoGroupID: todoGroupID, text: text);
    todoGroup.add(newTodo);
    await _todoGroupRepo.save(todoGroup);
  }

  Future<void> deleteTodoOnGroup(
      {required todoGroupID, required todoID}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    Todo todo = todoGroup.getTodoByID(todoID);
    todoGroup.remove(todo);
    await _todoGroupRepo.save(todoGroup);
  }

  Future<void> changeTodoStatus(
      {required String todoGroupID, required String todoID}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    Todo todo = todoGroup.getTodoByID(todoID);
    todo.changeStatus();
    await _todoGroupRepo.save(todoGroup);
  }

  Future<void> reorderTodoOnGroup(
      {required String todoGroupID,
      required String todoID,
      required int newTodoPosition}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    todoGroup.reorderTodo(todoID: todoID, newTodoPosition: newTodoPosition);
    await _todoGroupRepo.save(todoGroup);
  }

  Future<void> addTodoToGroup(
      {required String todoGroupID, required String text}) async {
    TodoGroup todoGroup = await _todoGroupRepo.getByID(todoGroupID);
    String newID = _todoGroupRepo.newID();
    Todo todo = Todo.create(id: newID, todoGroupID: todoGroupID, text: text);
    todoGroup.add(todo);
    await _todoGroupRepo.save(todoGroup);
  }
}
