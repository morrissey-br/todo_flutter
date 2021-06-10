abstract class DBContext {
  Map<String, dynamic> getByID({required String where, required String id});
  List<Map<String, dynamic>> getAll({required String where});
  void save(
      {required String where,
      required String id,
      required Map<String, dynamic> data});
  void remove({required String where, required String id});
}
