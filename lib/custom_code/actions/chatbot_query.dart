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
import 'package:langchain_chroma/langchain_chroma.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<String> chatbotQuery(String query, String topic) async {
  final llm = OpenAI(
      //apiKey: "OPENAI_APIKEY",
      temperature: 0.9);

  final prompt =
      'You are a chatbot assiting students on. The student has hasked $query on this $topic. Please respond in a short and clear way';

  // Code to query Chroma
  // final vectorStore = Chroma(host: '');
  // final queryResponse = await vectorStore.similaritySearch(
  //   query: 'What did the president say about Ketanji Brown Jackson',
  //   config: ChromaSimilaritySearch(k: 3, embeddings: embeddings),
  // );

  final res = await llm.predict(prompt);
  return (res);
}
