import 'package:advanced_assignment/load_user_data.dart';

void main() async {
  final StudentList = loadStudentData("lib/models/student.txt");

  print(StudentList);
}
