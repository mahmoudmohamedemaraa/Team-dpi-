abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
  Future<bool> checksIfDataExists({
    required String path,
    required String documentId,
  });
  Future<void> deleteData({required String path, required String documentId});
  Stream<List<Map<String, dynamic>>> streamCollection({required String path});
}
