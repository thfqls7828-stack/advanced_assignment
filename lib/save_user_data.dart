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
