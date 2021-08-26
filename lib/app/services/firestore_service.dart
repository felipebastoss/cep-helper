import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  static FirestoreService _instance = FirestoreService._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int count = 0;

  FirestoreService._internal();

  static FirestoreService getInstance() {
    return _instance;
  }

  Future<void> adicionarCep(Map<String, dynamic> dados) async {
    await firestore
        .collection("ceps")
        .doc(count.toString())
        .set(dados)
        .then((value) => count++);
  }
}
