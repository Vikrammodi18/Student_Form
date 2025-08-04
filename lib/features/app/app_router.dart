import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:student_entry_app/core/providers/auth_provider.dart";
import "package:student_entry_app/features/student/student_form.dart";
import "package:student_entry_app/features/student/student_list.dart";
import "package:student_entry_app/screen/home_screen.dart";
import "package:student_entry_app/screen/login_screen.dart";

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      final loggedIn = authState.isLoggedIn;
     
      final loggingIn = state.fullPath == '/login';

      if (!loggedIn && !loggingIn) return '/login';

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/studentForm', builder: (context, state) => StudentForm()),
      GoRoute(path: "/studentList", builder: (context, state) => StudentList()),
    ],
  );
});
