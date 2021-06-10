// TODO: Criar DB que salve no dispositivo
import 'package:todo_flutter/core/gateways/DBContext.dart';

class OnMemoryListDBContext implements DBContext {
  List<Map<String, dynamic>> _todoGroups = [];

  @override
  Map<String, dynamic> getByID({required String where, required String id}) {
    if (where == 'TodoGroups') {
      return _todoGroups.firstWhere((element) => element['id'] == id);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  List<Map<String, dynamic>> getAll({required String where}) {
    if (where == 'TodoGroups') {
      return _todoGroups;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void save(
      {required String where,
      required String id,
      required Map<String, dynamic> data}) {
    if (where == 'TodoGroups') {
      if (_todoGroups.any((element) => element['id'] == id)) {
        int index = _todoGroups.indexWhere((element) => element['id'] == id);
        remove(where: where, id: id);
        _todoGroups.insert(index, data);
      } else {
        _todoGroups.add(data);
      }
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void remove({required String where, required String id}) {
    if (where == 'TodoGroups') {
      _todoGroups.removeWhere((element) => element['id'] == id);
    } else {
      throw UnimplementedError();
    }
  }

  // MemoryTodoGroupsDatabase() {
  //   final todoGroup0 = TodoGroup.create(
  //     title: 'Groceries',
  //     color: Colors.orange.value,
  //   );
  //   final todoGroup1 = TodoGroup.create(
  //     title: 'Work',
  //     color: Colors.purple.value,
  //   );
  //   final todoGroup2 = TodoGroup.create(
  //     title: 'Todo',
  //     color: Colors.blue.value,
  //   );

  //   final dateTodo = Todo.create(text: 'Diner with Carol');

  //   final doneTodo = Todo.create(text: 'Print boarding pass');
  //   doneTodo.changeStatus();

  //   todoGroup2.add(dateTodo);
  //   todoGroup2.add(Todo.create(text: 'Book hotel'));
  //   todoGroup2.add(Todo.create(text: 'Hair cut'));
  //   todoGroup2.add(doneTodo);

  //   this._todoGroups = [];

  //   add(todoGroup0);
  //   add(todoGroup1);
  //   add(todoGroup2);
  // }
}
