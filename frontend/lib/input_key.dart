import 'dart:math';

class InputKey {
  final int value;
  final int paintedCount;

  InputKey({required this.value, required this.paintedCount});

  int get alpha => min((paintedCount / 100 * 255).round(), 255);

  factory InputKey.fromJson(Map<String, Object> json) {
    return InputKey(
      value: json['value'] as int,
      paintedCount: json['paintedCount'] as int,
    );
  }

  InputKey copyWith({int? value, int? paintedCount}) {
    return InputKey(
      value: value ?? this.value,
      paintedCount: paintedCount ?? this.paintedCount,
    );
  }
}
