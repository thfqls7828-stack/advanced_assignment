import 'dart:io';

import 'package:advanced_assignment/load_user_data.dart';

void main() async {
  final studentList = await loadStudentData("lib/models/student.txt");

  printStudentInfo(studentList);
}
