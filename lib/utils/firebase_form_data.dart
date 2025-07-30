import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFormData {
  static Future<void> FirebaseFormSubmit({
    required String name,
    required int mobile,
    required int age,
  }) async {
    await FirebaseFirestore.instance.collection('students').add({
      'name': name,
      'mobile': mobile,
      'age': age,
      'timestamp': FieldValue.serverTimestamp(), // optional
    });
  }
}
