import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_entry_app/controller/provider.dart';

class StudentList extends ConsumerStatefulWidget {
  const StudentList({super.key});

  @override
  ConsumerState<StudentList> createState() => _StudentListState();
}

class _StudentListState extends ConsumerState<StudentList> {
  @override
  Widget build(BuildContext context) {
    final students = ref.watch(studentProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Students List')),
      body: students.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name),
                subtitle: Text("Mobile:${data[index].mobile}"),
                trailing: Text("Age: ${data[index].age}"),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
