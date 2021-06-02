import 'package:flutter/cupertino.dart';
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

  void addTodoGroup({String title, int color}) {
    TodoGroup aTodoGroup = TodoGroup.create(title: title, color: color);
    _todoGroupRepository.add(aTodoGroup);
  }

  TodoGroup getTodoGroupByID(String aTodoGroupID) {
    return _todoGroupRepository.getByID(aTodoGroupID);
  }

  List<TodoGroup> getAllTodoGroups() {
    return _todoGroupRepository.getAll();
  }

  void addTodoToGroup({String todoGroupID, String todoText}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    Todo aTodo = Todo.create(text: todoText);
    aTodoGroup.add(aTodo);
  }

  void reorderTodoOnGroup(
      {String todoGroupID, String todoID, int newTodoPosition}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.reorderTodo(todoID: todoID, newTodoPosition: newTodoPosition);
  }

  void changeTodoGroupTitle({String todoGroupID, String newTitle}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.changeTodoGroupTitle(newTitle: newTitle);
  }

  void markTodoState({String todoGroupID, String todoID}) {
    TodoGroup aTodoGroup = _todoGroupRepository.getByID(todoGroupID);
    aTodoGroup.todos.firstWhere((todo) => todo.id == todoID).changeStatus();
  }
}
