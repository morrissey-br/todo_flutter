import 'package:sqflite/sqflite.dart';
import 'package:todo_flutter/core/domain/model/TodoGroup.dart';
import 'package:todo_flutter/core/domain/repositories/TodoGroupRepo.dart';
import 'package:todo_flutter/core/infrastructure/RepoSQlite.dart';
import 'package:todo_flutter/core/infrastructure/TodoRepoSQLite.dart';
import 'package:uuid/uuid.dart';

class TodoGroupRepoSQLite extends RepoSQLite<TodoGroup>
    implements TodoGroupRepo {
  static String _tableName = 'todoGroups';
  static String createTableSQL() {
    return 'CREATE TABLE `$_tableName` (`id` TEXT,	`title` TEXT,	`color` INT, PRIMARY KEY (`id`));';
  }

  @override
  String newID() {
    return Uuid().v4();
  }

  @override
  Future<List<TodoGroup>> getAll() async {
    final db = await this.db();
    final list = await db.query(_tableName);
    return list
        .map((map) => TodoGroup.create(
            map['id'] as String, map['title'] as String, map['color'] as int))
        .toList();
  }

  @override
  Future<TodoGroup> getByID(String id) async {
    final db = await this.db();
    final list = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (list.isEmpty) {
      throw ('No data with id $id in table $_tableName');
    }
    final map = list[0];
    final todos = await TodoRepoSQLite(id).getAllByTodoGroupID(id);
    return TodoGroup.rebuild(map['id'] as String, map['title'] as String,
        map['color'] as int, todos);
  }

  @override
  Future<void> remove(TodoGroup todoGroup) async {
    final db = await this.db();
    db.delete(_tableName, where: 'id = ?', whereArgs: [todoGroup.id]);
  }

  @override
  Future<void> save(TodoGroup todoGroup) async {
    final db = await this.db();
    await db.insert(
        _tableName,
        {
          'id': todoGroup.id,
          'title': todoGroup.title,
          'color': todoGroup.color
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    todoGroup.todos.forEach((todo) async {
      await TodoRepoSQLite(todoGroup.id).save(todo);
    });
  }
}
