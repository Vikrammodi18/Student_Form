import 'package:flutter/material.dart';
import 'package:student_entry_app/auth/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Login Page"), centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/login.jpg'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "+91 XXXXXXXXXX",
                    labelText: "Mobile Number",
                    border: OutlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  AuthRepository.phoneNumberVerification(
                    phoneNumber: phoneController.text.trim(),
                    context: context,
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
