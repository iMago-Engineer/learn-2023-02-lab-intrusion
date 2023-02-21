import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lab_intrusion/input_key.dart';
import 'package:lab_intrusion/question.dart';

final createQuestionProvider =
    StateNotifierProvider<CreateQuestionNotifier, Question>(
        (ref) => CreateQuestionNotifier(Question.blank()));

class CreateQuestionNotifier extends StateNotifier<Question> {
  CreateQuestionNotifier(super.state);

  void tap(int value) {
    final oldKey = state.inputKeys.firstWhere((key) => key.value == value);
    final newKey = oldKey.copyWith(paintedCount: oldKey.paintedCount + 1);

    final index = state.inputKeys.indexOf(oldKey);
    final newInputKeys = [...state.inputKeys];
    newInputKeys[index] = newKey;

    final newState = state.copyWith(inputKeys: newInputKeys);
    state = newState;
  }

  static const int numberOfUnlocks = 200;

  void _setAnswer(List<int> answer) {
    state = state.copyWith(answer: answer);
  }

  List<int> _randomUniqueNumbers({
    required int start,
    required int end,
    required int n,
  }) {
    final random = Random();
    final numbers = List<int>.generate(end - start + 1, (i) => i + start);
    numbers.shuffle(random);

    return numbers.sublist(0, n);
  }

  List<int> _randomTapsFrom({
    required List<int> startingNumber,
    required int n,
  }) {
    final randomTaps = [...startingNumber];

    final random = Random();
    randomTaps.shuffle(random);

    return randomTaps.sublist(0, n);
  }

  void generateTapPattern(List<int> answer) {
    _setAnswer(answer);

    const numberOfStartingNumber = 4;
    const numberOfRandomTapBeforeUnlock = 3;

    for (var i = 0; i < numberOfUnlocks; i++) {
      final startingNumber =
          _randomUniqueNumbers(start: 1, end: 9, n: numberOfStartingNumber);
      final randomTaps = _randomTapsFrom(
          startingNumber: startingNumber, n: numberOfRandomTapBeforeUnlock);
      for (var value in randomTaps) {
        tap(value);
      }

      for (var value in state.answer) {
        tap(value);
      }
    }
  }

  void reset() {
    state = Question.blank();
  }
}
