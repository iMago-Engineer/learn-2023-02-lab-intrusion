import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputPasswordDuringSolveProvider =
    StateNotifierProvider<InputPasswordDuringSolveNotifier, List<int>>(
        (ref) => InputPasswordDuringSolveNotifier([]));

class InputPasswordDuringSolveNotifier extends StateNotifier<List<int>> {
  InputPasswordDuringSolveNotifier(super.state);

  void addInput(int key) {
    state = [...state, key];
  }

  void reset() {
    state = [];
  }
}
