import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_entry_app/utils/firebase_form_data.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student entry"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/studentList');
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  } else if (val.length < 10) {
                    return "Mobile number must be 10 digit";
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
                  } else if (age < 18 && age > 100) {
                    return "age must be under 100 and above 18";
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Save to Firestore
                    final name = _nameController.text.trim();
                    final mobile = int.tryParse(_mobileController.text);
                    final age = int.tryParse(_ageController.text.trim());
                    await FirebaseFormData.FirebaseFormSubmit(
                      name: name,
                      mobile: mobile!,
                      age: age!,
                    );
                    print("Data saved to Firebase ✅");
                    _nameController.clear();
                    _mobileController.clear();
                    _ageController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Student data saved ✅")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Validation failed")),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
