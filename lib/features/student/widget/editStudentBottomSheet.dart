import 'package:flutter/material.dart';
import 'package:student_entry_app/model/student.model.dart';

class Editstudentbottomsheet extends StatefulWidget {
  final Student student;
  const Editstudentbottomsheet({super.key, required this.student});

  @override
  State<Editstudentbottomsheet> createState() => _EditstudentbottomsheetState();
}

class _EditstudentbottomsheetState extends State<Editstudentbottomsheet> {
  @override
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _ageController;
  
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
