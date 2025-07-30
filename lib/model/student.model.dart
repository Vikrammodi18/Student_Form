// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  late List<Student> student;
}

class Student {
  final String name;
  final int mobile;
  final int age;
  final Timestamp timestamp;
  Student({
    required this.name,
    required this.mobile,
    required this.age,
    required this.timestamp,
  });

  // Student copyWith({
  //   String? name,
  //   String? mobile,
  //   String? age,
  //   Timestamp? timestamp,
  // }) {
  //   return Student(
  //     name: name ?? this.name,
  //     mobile: mobile ?? this.mobile,
  //     age: age ?? this.age,
  //     timestamp: timestamp ?? this.timestamp,
  //   );
  // }

  // factory Student.fromMap(Map<String, dynamic> map) {
  //   return Student(
  //     name: map['name'] as String,
  //     mobile: map['mobile'] as String,
  //     age: map['age'] as String,
  //     timestamp:  map['timestamp'] as Timestamp,
  //   );
  // }

  factory Student.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Student(
      name: data['name'] as String,
      mobile: int.tryParse(data['mobile'].toString()) ?? 0,
      age: int.tryParse(data['age'].toString()) ?? 0,
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }
}
