abstract class Repository<T> {
  String newID();
  Future<void> save(T entity);
  Future<void> remove(T entity);
  Future<T> getByID(String id);
}
