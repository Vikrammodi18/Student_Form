import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:student_entry_app/controller/provider.dart';
import 'package:student_entry_app/features/student/widget/editStudentBottomSheet.dart';

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
              return Card(
                child: ListTile(
                  title: Text("${data[index].name}"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mobile: ${data[index].mobile}"),
                      Text("Age ${data[index].age}"),
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.vertical(
                        //     top: Radius.circular(20),
                        //   ),
                        // ),
                        builder: (BuildContext context) {
                          return Editstudentbottomsheet(student: data[index]);
                        },
                      );
                    },
                    child: Icon(Icons.edit_note_rounded),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
