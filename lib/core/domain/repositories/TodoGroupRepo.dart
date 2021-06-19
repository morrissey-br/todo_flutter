import 'package:todo_flutter/core/domain/concepts/Repository.dart';
import 'package:todo_flutter/core/domain/model/TodoGroup.dart';

abstract class TodoGroupRepo implements Repository<TodoGroup> {
  Future<List<TodoGroup>> getAll();
}
