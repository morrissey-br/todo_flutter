import 'package:todo_flutter/model/TodoGroup.dart';

abstract class TodoGroupRepository {
  void add(TodoGroup aTodoGroup);

  void remove(TodoGroup aTodoGroup);

  TodoGroup getByIndex(int index);

  void reorderGroup(int oldIndex, int newIndex);

  List<TodoGroup> getAll();
}
