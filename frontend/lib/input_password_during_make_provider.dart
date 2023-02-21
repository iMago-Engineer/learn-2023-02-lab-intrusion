// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lab_intrusion/input_keys_provider.dart';

// final inputPasswordDuringMakeProvider =
//     StateNotifierProvider<InputPasswordDuringMakeNotifier, List<InputKey>>(
//   (ref) => InputPasswordDuringMakeNotifier(
//     [1, 2, 3, 4, 5, 6, 7, 8, 9]
//         .map((value) => InputKey(value: value, paintedCount: 0))
//         .toList(),
//   ),
// );

// class InputPasswordDuringMakeNotifier extends StateNotifier<List<InputKey>> {
//   InputPasswordDuringMakeNotifier(super.state);

//   void tapInput(InputKey tappedKey) {
//     final index = state.indexOf(tappedKey);
//     final newInputKey =
//         tappedKey.copyWith(paintedCount: tappedKey.paintedCount + 1);

//     final newState = [...state];
//     newState[index] = newInputKey;

//     state = newState;
//   }

//   void reset() {
//     state = [];
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputPasswordDuringMakeProvider =
    StateNotifierProvider<InputPasswordDuringMakeNotifier, List<int>>(
        (ref) => InputPasswordDuringMakeNotifier([]));

class InputPasswordDuringMakeNotifier extends StateNotifier<List<int>> {
  InputPasswordDuringMakeNotifier(super.state);

  void addInput(int key) {
    state = [...state, key];
  }

  void reset() {
    state = [];
  }
}
