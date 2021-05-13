import 'package:todo_flutter/model/TodoGroup.dart';

abstract class TodoGroupRepository {
  void add(TodoGroup aTodoGroup);

  void remove(TodoGroup aTodoGroup);

  TodoGroup getByIndex(num index);

  List<TodoGroup> getAll();
}
