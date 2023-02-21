import 'package:lab_intrusion/input_key.dart';

class Question {
  final int? id;
  final List<int> answer;
  final List<InputKey> inputKeys;

  Question({required this.id, required this.answer, required this.inputKeys});

  Question.blank()
      : this(
          id: null,
          answer: [],
          inputKeys: [1, 2, 3, 4, 5, 6, 7, 8, 9]
              .map((value) => InputKey(value: value, paintedCount: 0))
              .toList(),
        );

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
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

  Question copyWith({int? id, List<int>? answer, List<InputKey>? inputKeys}) {
    return Question(
      id: id ?? this.id,
      answer: answer ?? this.answer,
      inputKeys: inputKeys ?? this.inputKeys,
    );
  }
}
