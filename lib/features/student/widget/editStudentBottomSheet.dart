import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_entry_app/controller/provider.dart';
import 'package:student_entry_app/model/student.model.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';
import 'package:student_entry_app/utils/firebase_form_data.dart';

class Editstudentbottomsheet extends ConsumerStatefulWidget {
  final Student student;
  const Editstudentbottomsheet({super.key, required this.student});

  @override
  ConsumerState<Editstudentbottomsheet> createState() =>
      _EditstudentbottomsheetState();
}

class _EditstudentbottomsheetState
    extends ConsumerState<Editstudentbottomsheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _ageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _ageController = TextEditingController(text: widget.student.age.toString());
    _mobileController = TextEditingController(
      text: widget.student.mobile.toString(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _mobileController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    hint: Text("Enter Student Name"),
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController,
                  validator: (val) {
                    if (val == null || val.isEmpty || val.trim() == "") {
                      return "Please Enter Student Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    labelText: "Mobile No.",
                    hint: Text('Enter Mobile No.'),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (val) {
                    if (val == null || val.isEmpty || val.trim() == "") {
                      return "Mobile NUmber can't be empty";
                    } else if (val.length < 10 || val.length > 10) {
                      return "Mobile number must be 10 digit";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hint: Text("Age"),
                    label: Text("Enter Age"),
                    border: OutlineInputBorder(),
                  ),
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (val) {
                    if (val == null || val.isEmpty || val.trim() == "") {
                      return "Age cann't be empty";
                    }
                    final age = int.tryParse(val);
                    if (age == null) {
                      return "age cannot be empty";
                    } else if (age < 18 || age > 100) {
                      return "age must be under 100 and above 18";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Save to Firestore
                          final name = _nameController.text.trim();
                          final mobile = int.tryParse(_mobileController.text);
                          final age = int.tryParse(_ageController.text.trim());
                          await FirebaseFormData.updateData(
                            sId: widget.student.id,
                            name: name,
                            age: age!,
                            mobile: mobile!,
                          );

                          _nameController.clear();
                          _mobileController.clear();
                          _ageController.clear();
                          // ignore: unused_result
                          ref.refresh(studentProvider);
                          context.pop();
                          showSnackBar(
                            message: "update successfully",
                            context: context,
                          );
                        } else {
                          showSnackBar(
                            message: "validation failed",
                            context: context,
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseFormData.deleteData(
                          sId: widget.student.id,
                          context: context,
                        );
                        // ignore: unused_result
                        ref.refresh(studentProvider);
                        context.pop();
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
