import 'dart:convert';
import 'dart:io';

import 'package:advanced_assignment/score_student.dart';

// 학생 이름을 입력 받아 해당 학생의 데이터를 출력하는 함수
ScoreStudent printStudentInfo(List<ScoreStudent> studentList) {
  while (true) {
    print("어떤 학생의 점수를 확인하시겠습니까?");
    String? name = stdin.readLineSync(encoding: utf8);

    if (studentList.any((student) => student.name == name)) {
      final ScoreStudent student = studentList.firstWhere(
        (student) => student.name == name,
      );
      student.showInfo();
      return student;
    } else {
      print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
    }
  }
}
