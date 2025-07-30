import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/repo/student_repo.dart';

final studentProvider = FutureProvider.autoDispose(
  (ref) => StudentRepo().getStudent(),
);
