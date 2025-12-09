import 'package:advanced_assignment/load_user_data.dart';
import 'package:advanced_assignment/print_student_info.dart';
import 'package:advanced_assignment/save_user_data.dart';
import 'package:advanced_assignment/score_student.dart';

void main() async {
  final String studentPath = "lib/models/student.txt";
  final String resultPath = "lib/models/result.txt";

  final ScoreStudent studentInfo;

  // 학생의 데이터(name, score)를 담긴 List
  final studentList = await loadStudentData(studentPath);

  // 학생 정보가 담긴 객체 하나를 반환 받음
  studentInfo = printStudentInfo(studentList);

  // 경로를 따라 reulst.txt에 content 저장
  saveResults(
    resultPath,
    "이름 : ${studentInfo.name}, 점수 : ${studentInfo.score}",
  );
}
