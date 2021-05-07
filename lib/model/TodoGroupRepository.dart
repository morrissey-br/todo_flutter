import 'package:todo_flutter/model/TodoGroup.dart';

abstract class TodoGroupRepository {
  void add(TodoGroup aTodoGroup);

  void remove(TodoGroup aTodoGroup);

  List<TodoGroup> getAll();
}
