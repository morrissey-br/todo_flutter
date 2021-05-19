import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String text;
  bool status;

  Todo._(this.id, this.text, this.status);

  static Todo create({String text}) {
    return Todo._(Uuid().v1(), text, false);
  }

  complete() {
    this.status = true;
  }

  edit(String text) {
    this.text = text;
  }
}
