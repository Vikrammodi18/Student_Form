import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/controller/provider.dart';
import 'package:student_entry_app/screen/login_screen.dart';
import 'package:student_entry_app/screen/student_form.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authTokenProvider);
    return authState.when(
      data: (data) {
        if (data != null && data.isNotEmpty) {
          return const StudentForm();
        } else {
          return LoginScreen();
        }
      },
      error: (error, stack) =>
          Scaffold(body: Center(child: Text("Error:$error"))),
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
