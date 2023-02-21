import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'input_keys_provider.g.dart';

class InputKey {
  final int value;
  final int paintedCount;

  InputKey({required this.value, required this.paintedCount});

  int get alpha => min((paintedCount / 100 * 255).round(), 255);

  InputKey copyWith({int? value, int? paintedCount}) {
    return InputKey(
      value: value ?? this.value,
      paintedCount: paintedCount ?? this.paintedCount,
    );
  }
}

@riverpod
class InputKeys extends _$InputKeys {
  @override
  List<InputKey> build() {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9]
        .map((value) => InputKey(value: value, paintedCount: 0))
        .toList();
  }
}
