import 'package:lab_intrusion/input_key.dart';

class Question {
  final List<int> answer;
  final List<InputKey> inputKeys;

  Question({required this.answer, required this.inputKeys});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      answer: (json['answer'] as int)
          .toString()
          .split('')
          .map((e) => int.parse(e))
          .toList(),
      inputKeys: (json['paints'] as List<dynamic>)
          .map(
            (paint) => InputKey(
              value: int.parse(paint['target']),
              paintedCount: paint['painted_count'],
            ),
          )
          .toList(),
    );
  }
}
