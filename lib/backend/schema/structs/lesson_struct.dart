// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonStruct extends FFFirebaseStruct {
  LessonStruct({
    String? lessonName,
    String? moduleName,
    int? chapter,
    List<LessonContentStruct>? lessonContent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lessonName = lessonName,
        _moduleName = moduleName,
        _chapter = chapter,
        _lessonContent = lessonContent,
        super(firestoreUtilData);

  // "lessonName" field.
  String? _lessonName;
  String get lessonName => _lessonName ?? '';
  set lessonName(String? val) => _lessonName = val;
  bool hasLessonName() => _lessonName != null;

  // "moduleName" field.
  String? _moduleName;
  String get moduleName => _moduleName ?? '';
  set moduleName(String? val) => _moduleName = val;
  bool hasModuleName() => _moduleName != null;

  // "chapter" field.
  int? _chapter;
  int get chapter => _chapter ?? 0;
  set chapter(int? val) => _chapter = val;
  void incrementChapter(int amount) => _chapter = chapter + amount;
  bool hasChapter() => _chapter != null;

  // "lessonContent" field.
  List<LessonContentStruct>? _lessonContent;
  List<LessonContentStruct> get lessonContent => _lessonContent ?? const [];
  set lessonContent(List<LessonContentStruct>? val) => _lessonContent = val;
  void updateLessonContent(Function(List<LessonContentStruct>) updateFn) =>
      updateFn(_lessonContent ??= []);
  bool hasLessonContent() => _lessonContent != null;

  static LessonStruct fromMap(Map<String, dynamic> data) => LessonStruct(
        lessonName: data['lessonName'] as String?,
        moduleName: data['moduleName'] as String?,
        chapter: castToType<int>(data['chapter']),
        lessonContent: getStructList(
          data['lessonContent'],
          LessonContentStruct.fromMap,
        ),
      );

  static LessonStruct? maybeFromMap(dynamic data) =>
      data is Map ? LessonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lessonName': _lessonName,
        'moduleName': _moduleName,
        'chapter': _chapter,
        'lessonContent': _lessonContent?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lessonName': serializeParam(
          _lessonName,
          ParamType.String,
        ),
        'moduleName': serializeParam(
          _moduleName,
          ParamType.String,
        ),
        'chapter': serializeParam(
          _chapter,
          ParamType.int,
        ),
        'lessonContent': serializeParam(
          _lessonContent,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static LessonStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonStruct(
        lessonName: deserializeParam(
          data['lessonName'],
          ParamType.String,
          false,
        ),
        moduleName: deserializeParam(
          data['moduleName'],
          ParamType.String,
          false,
        ),
        chapter: deserializeParam(
          data['chapter'],
          ParamType.int,
          false,
        ),
        lessonContent: deserializeStructParam<LessonContentStruct>(
          data['lessonContent'],
          ParamType.DataStruct,
          true,
          structBuilder: LessonContentStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LessonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LessonStruct &&
        lessonName == other.lessonName &&
        moduleName == other.moduleName &&
        chapter == other.chapter &&
        listEquality.equals(lessonContent, other.lessonContent);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([lessonName, moduleName, chapter, lessonContent]);
}

LessonStruct createLessonStruct({
  String? lessonName,
  String? moduleName,
  int? chapter,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonStruct(
      lessonName: lessonName,
      moduleName: moduleName,
      chapter: chapter,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonStruct? updateLessonStruct(
  LessonStruct? lesson, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lesson
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonStructData(
  Map<String, dynamic> firestoreData,
  LessonStruct? lesson,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lesson == null) {
    return;
  }
  if (lesson.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lesson.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonData = getLessonFirestoreData(lesson, forFieldValue);
  final nestedData = lessonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lesson.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonFirestoreData(
  LessonStruct? lesson, [
  bool forFieldValue = false,
]) {
  if (lesson == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lesson.toMap());

  // Add any Firestore field values
  lesson.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonListFirestoreData(
  List<LessonStruct>? lessons,
) =>
    lessons?.map((e) => getLessonFirestoreData(e, true)).toList() ?? [];
