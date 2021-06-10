import 'package:todo_flutter/core/gateways/DBContext.dart';
import 'package:todo_flutter/core/gateways/IDGenerator.dart';
import 'package:todo_flutter/core/concepts/Repository.dart';
import 'package:todo_flutter/core/model/TodoGroup.dart';

class TodoGroups extends Repository<TodoGroup> {
  DBContext _dbContext;
  IDGenerator _idGenerator;

  String location = 'TodoGroups';

  TodoGroups.instantiate(this._dbContext, this._idGenerator)
      : super.instantiate();

  @override
  String newID() {
    return _idGenerator.newID();
  }

  @override
  TodoGroup getByID(String id) {
    final data = _dbContext.getByID(where: location, id: id);
    var todoGroup = TodoGroup.fromMap(data);
    return todoGroup;
  }

  @override
  List<TodoGroup> getAll() {
    final allData = _dbContext.getAll(where: location);
    var allTodoGroups = allData.map((data) => TodoGroup.fromMap(data)).toList();
    return allTodoGroups;
  }

  @override
  void save(TodoGroup todoGroup) {
    final data = todoGroup.toMap();
    _dbContext.save(where: location, id: todoGroup.id, data: data);
  }

  @override
  void saveAll(List<TodoGroup> listOfTodoGroups) {
    listOfTodoGroups.forEach((todoGroup) {
      save(todoGroup);
    });
  }

  @override
  void remove(TodoGroup todoGroup) {
    _dbContext.remove(where: location, id: todoGroup.id);
  }

  @override
  void removeAll(List<TodoGroup> listOfTodoGroups) {
    listOfTodoGroups.forEach((todoGroup) {
      remove(todoGroup);
    });
  }
}
