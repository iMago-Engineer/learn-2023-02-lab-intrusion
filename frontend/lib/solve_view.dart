import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_intrusion/fetch_question.dart';
import 'package:lab_intrusion/input_password_during_solve_provider.dart';
import 'package:lab_intrusion/result_dialog.dart';

class SolveView extends ConsumerWidget {
  const SolveView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = ref.watch(fetchQuestionProvider);

    return Column(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: question.when(
                data: (question) {
                  return GridView.count(
                    crossAxisCount: 3,
                    children: question.inputKeys
                        .map(
                          (key) => InkWell(
                            child: Container(
                              color: Colors.grey.withAlpha(key.alpha),
                              alignment: Alignment.center,
                              child: Text('${key.value}'),
                            ),
                            onTap: () {
                              ref
                                  .read(
                                      inputPasswordDuringSolveProvider.notifier)
                                  .addInput(key.value);
                            },
                          ),
                        )
                        .toList(),
                  );
                },
                error: (err, stack) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator())),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${ref.watch(inputPasswordDuringSolveProvider)}'),
              IconButton(
                onPressed:
                    ref.read(inputPasswordDuringSolveProvider.notifier).reset,
                icon: const Icon(Icons.close),
              )
            ],
          ),
        ),
        question.when(
          data: (question) {
            return OutlinedButton(
              onPressed: () {
                final input = ref.watch(inputPasswordDuringSolveProvider);
                final correct = question.answer;
                if (kDebugMode) {
                  print('input: $input');
                  print('correct: $correct');
                  print('equal?: ${listEquals(input, correct)}');
                }

                final result = listEquals(input, correct);
                showDialog(
                  context: context,
                  builder: (context) => ResultDialog(result: result),
                );

                ref.read(inputPasswordDuringSolveProvider.notifier).reset();
              },
              child: const Text('答え合わせ'),
            );
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}