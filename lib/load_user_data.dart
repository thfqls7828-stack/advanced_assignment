import 'dart:convert';
import 'dart:io';

import 'package:advanced_assignment/score_student.dart';

// txt 파일의 데이터를 List<ScoreStudent>에 담는 함수
Future<List<ScoreStudent>> loadStudentData(String filePath) async {
  List<ScoreStudent> studentList = [];

  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0];
      int score = int.parse(parts[1]);
      studentList = [ScoreStudent(score: score, name: name)];
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return studentList;
}

// 학생 이름을 입력 받아 출력하는 함수
void printStudentInfo(List<ScoreStudent> studentList) {
  while (true) {
    for (ScoreStudent studentInfo in studentList) {
      print("어떤 학생의 점수를 확인하시겠습니까?");
      String? name = stdin.readLineSync(encoding: utf8);

      if (studentInfo.name == name) {
        studentInfo.showInfo();
        return;
      } else {
        print("잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.");
      }
    }
  }
}
