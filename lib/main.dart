import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/core/providers/auth_provider.dart';
import 'package:student_entry_app/features/app/app_router.dart';
import 'package:student_entry_app/screen/auth_wrapper.dart';
import 'package:student_entry_app/screen/home_screen.dart';
import 'package:student_entry_app/screen/login_screen.dart';
import 'package:student_entry_app/features/student/student_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_entry_app/features/student/student_list.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: "student entry app",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
