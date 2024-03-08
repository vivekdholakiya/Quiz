import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  Future addQuiz(
      Map<String, dynamic> addQuizFirebase, String name, String docName) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .doc(docName)
        .set(addQuizFirebase);
  }

  Future getCategoryData(String category) async {
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }
}
