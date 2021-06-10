import 'package:todo_flutter/core/gateways/DBContext.dart';
import 'package:todo_flutter/core/gateways/IDGenerator.dart';
import 'package:todo_flutter/core/model/TodoGroup.dart';
import 'package:todo_flutter/core/repositories/TodoGroups.dart';
import 'package:todo_flutter/api/dtos/TodoDTO.dart';

import 'dtos/TodoGroupDTO.dart';

class DomainPresenter {
  TodoGroups _todoGroups;

  DomainPresenter._(this._todoGroups);

  static DomainPresenter instantiate(
      DBContext dbContext, IDGenerator idGenerator) {
    return DomainPresenter._(TodoGroups.instantiate(dbContext, idGenerator));
  }

  TodoGroupDTO _toDTO(TodoGroup todoGroup) {
    List<TodoDTO> todosDTO = todoGroup.todos.map((todo) {
      return TodoDTO(id: todo.id, text: todo.text, status: todo.status);
    }).toList();
    return TodoGroupDTO(
        id: todoGroup.id,
        title: todoGroup.title,
        color: todoGroup.color,
        todos: todosDTO);
  }

  TodoGroupDTO getTodoGroupByID(String todoGroupID) {
    TodoGroup todoGroup = _todoGroups.getByID(todoGroupID);
    return _toDTO(todoGroup);
  }

  List<TodoGroupDTO> getAllTodoGroups() {
    List<TodoGroup> todoGroups = _todoGroups.getAll();
    return todoGroups.map((todoGroup) => _toDTO(todoGroup)).toList();
  }
}
