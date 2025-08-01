import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/repo/student_repo.dart';
import 'package:student_entry_app/useMethod.dart/essentialMethod.dart';

final studentProvider = FutureProvider.autoDispose(
  (ref) => StudentRepo().getStudent(),
);
final authTokenProvider = FutureProvider.autoDispose((ref) {
  final token = LocalStorage.getToken(name: "token");
  return token;
});
