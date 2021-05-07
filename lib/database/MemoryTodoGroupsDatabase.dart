import 'package:flutter/material.dart';
import 'package:todo_flutter/model/Todo.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/model/TodoGroupRepository.dart';

class MemoryTodoGroupsDatabase implements TodoGroupRepository {
  List<TodoGroup> _todoGroups;

  MemoryTodoGroupsDatabase() {
    final todoGroup0 = TodoGroup.create(
      title: 'Groceries',
      color: Colors.orange.value,
    );
    final todoGroup1 = TodoGroup.create(
      title: 'Work',
      color: Colors.purple.value,
    );
    final todoGroup2 = TodoGroup.create(
      title: 'Todo',
      color: Colors.blue.value,
    );

    final dateTodo = Todo.create('Diner with Carol');

    final doneTodo = Todo.create('Print boarding pass');
    doneTodo.complete();

    todoGroup2.add(dateTodo);
    todoGroup2.add(Todo.create('Book hotel'));
    todoGroup2.add(Todo.create('Hair cut'));
    todoGroup2.add(doneTodo);

    this._todoGroups = [];

    add(todoGroup0);
    add(todoGroup1);
    add(todoGroup2);
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
