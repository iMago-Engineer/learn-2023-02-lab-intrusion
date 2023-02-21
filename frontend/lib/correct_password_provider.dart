import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'correct_password_provider.g.dart';

@riverpod
List<int> correctPassword(CorrectPasswordRef ref) {
  return [1, 2, 3, 4];
}
