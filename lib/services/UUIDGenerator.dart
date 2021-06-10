import 'package:todo_flutter/core/gateways/IDGenerator.dart';
import 'package:uuid/uuid.dart';

class UUIDGenerator implements IDGenerator {
  @override
  String newID() {
    return Uuid().v4();
  }
}
