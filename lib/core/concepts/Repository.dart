abstract class Repository<T> {
  Repository.instantiate();

  String newID();
  T getByID(String id);
  List<T> getAll();
  void save(T entity);
  void saveAll(List<T> listOfEntities);
  void remove(T entity);
  void removeAll(List<T> listOfEntities);
}
