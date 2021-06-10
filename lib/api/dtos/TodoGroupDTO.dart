import 'TodoDTO.dart';

class TodoGroupDTO {
  String id;
  String title;
  int color;
  List<TodoDTO> todos;

  TodoGroupDTO(
      {required this.id,
      required this.title,
      required this.color,
      required this.todos});
}
