import 'package:sqflite/sqflite.dart';
import 'package:todo_flutter/core/domain/model/Todo.dart';
import 'package:todo_flutter/core/infrastructure/RepoSQlite.dart';
import 'package:uuid/uuid.dart';

class TodoRepoSQLite extends RepoSQLite<Todo> {
  String _todoGroupID;

  TodoRepoSQLite(this._todoGroupID);

  static String _tableName = 'todos';
  static String createTableSQL() {
    return 'CREATE TABLE `$_tableName` (`id` TEXT, `todogroupid` TEXT,	`text` TEXT,	`status` INT, PRIMARY KEY (`id`, `todogroupid`));';
  }

  @override
  String newID() {
    return Uuid().v4();
  }

  @override
  Future<Todo> getByID(String id) async {
    final db = await this.db();
    final list = await db.query(_tableName,
        where: 'id = ?, todogroupid = ?', whereArgs: [id, _todoGroupID]);
    if (list.isEmpty) {
      throw ('No todo with id $id for todoGroup with id $_todoGroupID');
    }
    final map = list[0];
    return Todo.rebuild(
        id: map['id'] as String,
        todoGroupID: map['todogroupid'] as String,
        text: map['text'] as String,
        status: map['status'] == 0 ? false : true);
  }

  Future<List<Todo>> getAllByTodoGroupID(String todoGroupID) async {
    final db = await this.db();
    final list = await db
        .query(_tableName, where: 'todogroupid = ?', whereArgs: [todoGroupID]);
    return list.map((todoMap) {
      return Todo.rebuild(
          id: todoMap['id'] as String,
          todoGroupID: todoMap['todogroupid'] as String,
          text: todoMap['text'] as String,
          status: todoMap['status'] == 0 ? false : true);
    }).toList();
  }

  @override
  Future<void> remove(todo) async {
    final db = await this.db();
    await db.delete(_tableName, where: 'id = ?', whereArgs: [todo.id]);
  }

  @override
  Future<void> save(todo) async {
    final db = await this.db();
    await db.insert(
        _tableName,
        {
          'id': todo.id,
          'todoGroupID': _todoGroupID,
          'text': todo.text,
          'status': todo.status ? true : false,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
