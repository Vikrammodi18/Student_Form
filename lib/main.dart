import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/screen/auth_wrapper.dart';
import 'package:student_entry_app/screen/login_screen.dart';
import 'package:student_entry_app/screen/student_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_entry_app/screen/student_list.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 249, 249, 249),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => AuthWrapper(),
        '/studentList': (context) => StudentList(),
        '/studentForm': (context) => StudentForm(),
      },
    );
  }
}
