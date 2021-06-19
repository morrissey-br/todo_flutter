abstract class DBContext {
  Future<Map<String, dynamic>> getByID(
      {required String where, required String id});
  Future<List<Map<String, dynamic>>> getAll({required String where});
  Future<void> save(
      {required String where,
      required String id,
      required Map<String, dynamic> data});
  Future<void> remove({required String where, required String id});
}
