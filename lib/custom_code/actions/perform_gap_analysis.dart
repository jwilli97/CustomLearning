// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

// Custom

Future<String> performGapAnalysis(String questionsWrong) async {
  final llm = OpenAI(
      apiKey: "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",
      temperature: 0.9);

  final prompt =
      'Create a detailed report highlighting gaps in student quiz performances along with new content to help the student bridge these gaps in the following JSON format.{ analysis: "", courseContent:""}';

  final res = await llm.predict(prompt);
  return (res);
}
