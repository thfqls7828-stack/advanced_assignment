# 🔎 challenge 1 : 성적 분석 프로그램
## 프로그래밍 요구사항
- 컬렉션을 활용하여 데이터 처리
- 파일 입출력을 통해 데이터를 읽기/쓰기
- 사용자 이름은 입력해 점수 확인
- 결과를 새로운 파일에 저장

## 구현
```dart
class Score {
  Score({required this.score});

  final int score;

  void showInfo() => print("점수 : $score");
}

```

```dart
import 'package:advanced_assignment/score.dart';

class ScoreStudent extends Score {
  ScoreStudent({required super.score, required this.name});

  final String name;

  @override
  void showInfo() => print("이름 : $name, 점수 : $score");
}
```

```dart
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
      studentList.add(ScoreStudent(score: score, name: name));
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return studentList;
}
```

```dart
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
```

```dart
import 'dart:io';

// 학생 데이터를 파일에 저장하는 함수
Future<void> saveResults(String filePath, String content) async {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}
```

- 점수와 이름을 입력 받을 Score, ScoreStudent class 추가
- dart.io 라이브러리의 File 클래스를 사용해 csv 형식의 txt 파일 읽기
- 파일에서 읽어온 데이터를 List<ScoreStudent>에 저장 -> studentList
- 반복문을 돌며, studentList 내 학생의 점수 출력 -> printStudentInfo()
- 출력된 학생의 결과를 result.txt 파일에 저장

## 실행결과
<img width="382" height="118" alt="image" src="https://github.com/user-attachments/assets/171694ed-9fdc-4fef-b93a-66655e85e8e9" />

