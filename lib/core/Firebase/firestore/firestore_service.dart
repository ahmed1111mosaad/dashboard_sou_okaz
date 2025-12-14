import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbaord_sou_okaz/core/Firebase/firestore/data_service.dart';

class FirestoreService implements DataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docuid,
  }) async {
    if (docuid != null) {
      await firestore.collection(path).doc(docuid).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuId,
  }) async {
    final data = await firestore.collection(path).doc(docuId).get();
    return data.exists;
  }

  @override
  Future<dynamic> getData({required String path, String? docuid}) async {
    if (docuid != null) {
      final queryDoc = await firestore.collection(path).doc(docuid).get();
      return queryDoc.data();
    } else {
      final querySnapshot = await firestore.collection(path).get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }
  }
}
