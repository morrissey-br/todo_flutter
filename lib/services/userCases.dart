import 'package:todo_flutter/database/MemoryTodoGroupsDatabase.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/model/TodoGroupRepository.dart';
import 'package:todo_flutter/model/Todo.dart';

class UserCases {
  TodoGroupRepository _todoGroupRepository = MemoryTodoGroupsDatabase();

  UserCases._();

  static UserCases instance() {
    return UserCases._();
  }

  void addTodoGroup({String title, int color}) {
    TodoGroup aTodoGroup = TodoGroup.create(title: title, color: color);
    _todoGroupRepository.add(aTodoGroup);
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
}
