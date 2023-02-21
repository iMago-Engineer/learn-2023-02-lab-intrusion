import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_intrusion/make_view.dart';
import 'package:lab_intrusion/solve_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Tab(text: '解く'),
      const Tab(text: '作る'),
    ];

    final tabViews = [
      const SolveView(),
      const MakeView(),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('ラボ室侵入ゲーム'),
              bottom: TabBar(tabs: tabs),
            ),
            body: TabBarView(children: tabViews),
          );
        },
      ),
    );
  }
}
