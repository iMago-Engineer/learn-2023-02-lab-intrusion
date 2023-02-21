import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:lab_intrusion/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_question.g.dart';

@riverpod
Future<Question> fetchQuestion(FetchQuestionRef ref) async {
  final client = http.Client();

  final response =
      await client.get(Uri.parse('http://127.0.0.1:3000/questions/random'));
  final content = jsonDecode(response.body) as Map<String, dynamic>;

  return Question.fromJson(content);
}
