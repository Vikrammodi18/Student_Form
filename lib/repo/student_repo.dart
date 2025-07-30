import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_entry_app/model/student.model.dart';

class StudentRepo {
  Future<List<Student>> getStudent() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('students')
        .get();

    return snapshot.docs.map((doc) => Student.fromFirestore(doc)).toList();
  }
}











