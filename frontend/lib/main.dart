import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_intrusion/correct_password_provider.dart';
import 'package:lab_intrusion/input_keys_provider.dart';
import 'package:lab_intrusion/input_password_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ラボ室侵入ゲーム',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ラボ室侵入ゲーム')),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: GridView.count(
              crossAxisCount: 3,
              children: ref
                  .watch(inputKeysProvider)
                  .map(
                    (key) => InkWell(
                      child: Container(
                        color: Colors.grey.withAlpha(key.alpha),
                        alignment: Alignment.center,
                        child: Text('${key.value}'),
                      ),
                      onTap: () {
                        ref
                            .read(inputPasswordProvider.notifier)
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
                Text('${ref.watch(inputPasswordProvider)}'),
                IconButton(
                  onPressed: ref.read(inputPasswordProvider.notifier).reset,
                  icon: const Icon(Icons.close),
                )
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              final input = ref.watch(inputPasswordProvider);
              final correct = ref.watch(correctPasswordProvider);
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

              ref.read(inputPasswordProvider.notifier).reset();
            },
            child: const Text('答え合わせ'),
          )
        ],
      ),
    );
  }
}

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key, required this.result});

  final bool result;

  @override
  Widget build(BuildContext context) {
    final text = result ? '正解です' : '不正解です';

    return Dialog(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
