import 'Mappable.dart';

abstract class Entity<T extends Entity<T>> extends Mappable<T> {
  String _id;
  Entity(this._id);

  get id {
    return _id;
  }
}
