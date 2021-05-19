import 'package:flutter/material.dart';
import 'package:todo_flutter/model/Todo.dart';
import 'package:todo_flutter/model/TodoGroup.dart';
import 'package:todo_flutter/model/TodoGroupRepository.dart';

class MemoryTodoGroupsDatabase implements TodoGroupRepository {
  List<TodoGroup> _todoGroups;
  @override
  void add(TodoGroup aTodoGroup) {
    _todoGroups.add(aTodoGroup);
  }

  @override
  void remove(TodoGroup aTodoGroup) {
    _todoGroups.remove(aTodoGroup);
  }

  @override
  TodoGroup getByID(String id) {
    return _todoGroups.firstWhere((todo) => todo.id == id);
  }

  @override
  List<TodoGroup> getAll() {
    return _todoGroups;
  }

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

    final dateTodo = Todo.create(text: 'Diner with Carol');

    final doneTodo = Todo.create(text: 'Print boarding pass');
    doneTodo.complete();

    todoGroup2.add(dateTodo);
    todoGroup2.add(Todo.create(text: 'Book hotel'));
    todoGroup2.add(Todo.create(text: 'Hair cut'));
    todoGroup2.add(doneTodo);

    this._todoGroups = [];

    add(todoGroup0);
    add(todoGroup1);
    add(todoGroup2);
  }
}
