import 'package:flutter/material.dart';

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
