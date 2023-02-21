
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputPasswordProvider =
    StateNotifierProvider<InputPasswordNotifier, List<int>>(
        (ref) => InputPasswordNotifier([]));

class InputPasswordNotifier extends StateNotifier<List<int>> {
  InputPasswordNotifier(super.state);

  void addInput(int key) {
    state = [...state, key];
  }

  void reset() {
    state = [];
  }
}
