import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String text;
  bool status;

  Todo._(this.id, this.text, this.status);

  static Todo create({String text}) {
    return Todo._(Uuid().v1(), text, false);
  }

  changeStatus() {
    this.status = !this.status;
  }

  edit(String text) {
    this.text = text;
  }
}
