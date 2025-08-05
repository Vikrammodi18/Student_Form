import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';

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

  static Future<void> updateData({
    required String sId,
    required String name,
    required int mobile,
    required int age,
  }) async {
    await FirebaseFirestore.instance.collection('students').doc(sId).update({
      "name": name,
      "mobile": mobile,
      "age": age,
    });
  }

  static Future<void> deleteData({required String sId, required BuildContext context}) async {
try{

    await FirebaseFirestore.instance.collection('students').doc(sId).delete();
}catch(e){
  showSnackBar(message: 'error $e', context: context);
}

  }
}
