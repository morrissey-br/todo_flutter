import 'package:flutter/material.dart';
import 'package:todo_flutter/model/Todo.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/model/TodoGroupRepository.dart';

class MemoryTodoGroupsDatabase implements TodoGroupRepository {
  List<TodoGroup> _todoGroups;

  MemoryTodoGroupsDatabase() {
    final todo0 = TodoGroup.create(
      title: 'Groceries',
      color: Colors.orange.value,
    );
    final todo1 = TodoGroup.create(
      title: 'Work',
      color: Colors.purple.value,
    );
    final todo2 = TodoGroup.create(
      title: 'Todo',
      color: Colors.blue.value,
    );

    todo2.add(Todo.create('Diner with Carol'));
    todo2.add(Todo.create('Book hotel'));
    todo2.add(Todo.create('Hair cut'));
    todo2.add(Todo.create('Print boarding pass'));

    this._todoGroups = [];

    add(todo0);
    add(todo1);
    add(todo2);
  }

  void add(TodoGroup aTodoGroup) {
    _todoGroups.add(aTodoGroup);
  }

  void remove(TodoGroup aTodoGroup) {
    _todoGroups.remove(aTodoGroup);
  }

  List<TodoGroup> getAll() {
    return _todoGroups;
  }
}
