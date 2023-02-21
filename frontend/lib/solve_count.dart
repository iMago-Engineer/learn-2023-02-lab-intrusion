import 'package:flutter_riverpod/flutter_riverpod.dart';

final solveCountProvider = StateNotifierProvider<SolveCountNotifier, int>(
    (ref) => SolveCountNotifier(0));

class SolveCountNotifier extends StateNotifier<int> {
  SolveCountNotifier(super.state);

  void increment() {
    state = state + 1;
  }

  void reset() {
    state = 0;
  }
}
