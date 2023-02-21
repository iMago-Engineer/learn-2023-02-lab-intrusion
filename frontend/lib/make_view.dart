import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_intrusion/create_question_provider.dart';
import 'package:lab_intrusion/input_password_during_make_provider.dart';

class MakeView extends ConsumerWidget {
  const MakeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          child: GridView.count(
            crossAxisCount: 3,
            children: ref
                .watch(createQuestionProvider)
                .inputKeys
                .map(
                  (key) => InkWell(
                    child: Container(
                      color: Colors.grey.withAlpha(key.alpha),
                      alignment: Alignment.center,
                      child: Text('${key.value}'),
                    ),
                    onTap: () {
                      ref
                          .read(inputPasswordDuringMakeProvider.notifier)
                          .addInput(key.value);
                    },
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${ref.watch(inputPasswordDuringMakeProvider)}'),
              IconButton(
                onPressed: () {
                  ref.read(inputPasswordDuringMakeProvider.notifier).reset();
                  ref.read(createQuestionProvider.notifier).reset();
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () => ref
              .watch(createQuestionProvider.notifier)
              .generateTapPattern(ref.watch(inputPasswordDuringMakeProvider)),
          child: const Text('塗りパターンを作る'),
        ),
        OutlinedButton(
          onPressed: () {
            postQuestion(ref);
            ref.read(createQuestionProvider.notifier).reset();
          },
          child: const Text('塗りパターンを保存する'),
        )
      ],
    );
  }

  Future<void> postQuestion(WidgetRef ref) async {
    final question = ref.read(createQuestionProvider);

    final client = http.Client();

    await client.post(
      Uri.parse('http://localhost:3000/questions'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'question': {
          'answer': question.answer.join(''),
          'difficulty': CreateQuestionNotifier.numberOfUnlocks,
          'nickname': 'test',
          'paints': question.inputKeys
              .map((key) => {
                    'target': key.value,
                    'painted_count': key.paintedCount,
                  })
              .toList(),
        }
      }),
    );
  }
}
