import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const keys = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  List<int> answer = [];

  @override
  Widget build(BuildContext context) {
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
              children: keys
                  .map(
                    (key) => InkWell(
                      child: Center(child: Text('$key')),
                      onTap: () {
                        if (kDebugMode) {
                          print(key);
                        }
                        answer.add(key);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text('$answer'),
          ),
          TextButton(
              onPressed: () {
                print(answer);
              },
              child: const Text('答え合わせ'))
        ],
      ),
    );
  }
}
