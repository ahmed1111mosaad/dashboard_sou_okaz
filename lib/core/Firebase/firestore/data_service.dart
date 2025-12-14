abstract class DataService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docuid,
  });
  Future<dynamic> getData({required String path, String? docuid});

  Future<bool> checkIfDataExists({
    required String path,
    required String docuId,
  });
}