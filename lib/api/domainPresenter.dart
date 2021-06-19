import 'package:todo_flutter/core/domain/model/TodoGroup.dart';
import 'package:todo_flutter/core/domain/repositories/TodoGroupRepo.dart';
import 'package:todo_flutter/api/dtos/TodoDTO.dart';

import 'dtos/TodoGroupDTO.dart';

class DomainPresenter {
  TodoGroupRepo _todoGroups;

  DomainPresenter._(this._todoGroups);

  static DomainPresenter instantiate(TodoGroupRepo todoGroupRepo) {
    return DomainPresenter._(todoGroupRepo);
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

  Future<TodoGroupDTO> getTodoGroupByID(String todoGroupID) async {
    TodoGroup todoGroup = await _todoGroups.getByID(todoGroupID);
    return _toDTO(todoGroup);
  }

  Future<List<TodoGroupDTO>> getAllTodoGroups() async {
    List<TodoGroup> todoGroups = await _todoGroups.getAll();
    return todoGroups.map((todoGroup) => _toDTO(todoGroup)).toList();
  }
}
