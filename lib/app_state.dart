import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _toogleValue = false;
  bool get toogleValue => _toogleValue;
  set toogleValue(bool value) {
    _toogleValue = value;
  }

  List<LessonContentStruct> _selectedLessonContent = [];
  List<LessonContentStruct> get selectedLessonContent => _selectedLessonContent;
  set selectedLessonContent(List<LessonContentStruct> value) {
    _selectedLessonContent = value;
  }

  void addToSelectedLessonContent(LessonContentStruct value) {
    _selectedLessonContent.add(value);
  }

  void removeFromSelectedLessonContent(LessonContentStruct value) {
    _selectedLessonContent.remove(value);
  }

  void removeAtIndexFromSelectedLessonContent(int index) {
    _selectedLessonContent.removeAt(index);
  }

  void updateSelectedLessonContentAtIndex(
    int index,
    LessonContentStruct Function(LessonContentStruct) updateFn,
  ) {
    _selectedLessonContent[index] = updateFn(_selectedLessonContent[index]);
  }

  void insertAtIndexInSelectedLessonContent(
      int index, LessonContentStruct value) {
    _selectedLessonContent.insert(index, value);
  }

  String _selectedLessonName = '';
  String get selectedLessonName => _selectedLessonName;
  set selectedLessonName(String value) {
    _selectedLessonName = value;
  }

  int _questionIndex = 1;
  int get questionIndex => _questionIndex;
  set questionIndex(int value) {
    _questionIndex = value;
  }
}
