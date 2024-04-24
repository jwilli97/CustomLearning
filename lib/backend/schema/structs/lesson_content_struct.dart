// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonContentStruct extends FFFirebaseStruct {
  LessonContentStruct({
    String? subHeading,
    List<ContentBlocksStruct>? contentBlocks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subHeading = subHeading,
        _contentBlocks = contentBlocks,
        super(firestoreUtilData);

  // "subHeading" field.
  String? _subHeading;
  String get subHeading => _subHeading ?? '';
  set subHeading(String? val) => _subHeading = val;
  bool hasSubHeading() => _subHeading != null;

  // "contentBlocks" field.
  List<ContentBlocksStruct>? _contentBlocks;
  List<ContentBlocksStruct> get contentBlocks => _contentBlocks ?? const [];
  set contentBlocks(List<ContentBlocksStruct>? val) => _contentBlocks = val;
  void updateContentBlocks(Function(List<ContentBlocksStruct>) updateFn) =>
      updateFn(_contentBlocks ??= []);
  bool hasContentBlocks() => _contentBlocks != null;

  static LessonContentStruct fromMap(Map<String, dynamic> data) =>
      LessonContentStruct(
        subHeading: data['subHeading'] as String?,
        contentBlocks: getStructList(
          data['contentBlocks'],
          ContentBlocksStruct.fromMap,
        ),
      );

  static LessonContentStruct? maybeFromMap(dynamic data) => data is Map
      ? LessonContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subHeading': _subHeading,
        'contentBlocks': _contentBlocks?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subHeading': serializeParam(
          _subHeading,
          ParamType.String,
        ),
        'contentBlocks': serializeParam(
          _contentBlocks,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static LessonContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonContentStruct(
        subHeading: deserializeParam(
          data['subHeading'],
          ParamType.String,
          false,
        ),
        contentBlocks: deserializeStructParam<ContentBlocksStruct>(
          data['contentBlocks'],
          ParamType.DataStruct,
          true,
          structBuilder: ContentBlocksStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LessonContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LessonContentStruct &&
        subHeading == other.subHeading &&
        listEquality.equals(contentBlocks, other.contentBlocks);
  }

  @override
  int get hashCode => const ListEquality().hash([subHeading, contentBlocks]);
}

LessonContentStruct createLessonContentStruct({
  String? subHeading,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonContentStruct(
      subHeading: subHeading,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonContentStruct? updateLessonContentStruct(
  LessonContentStruct? lessonContent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lessonContent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonContentStructData(
  Map<String, dynamic> firestoreData,
  LessonContentStruct? lessonContent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lessonContent == null) {
    return;
  }
  if (lessonContent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lessonContent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonContentData =
      getLessonContentFirestoreData(lessonContent, forFieldValue);
  final nestedData =
      lessonContentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lessonContent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonContentFirestoreData(
  LessonContentStruct? lessonContent, [
  bool forFieldValue = false,
]) {
  if (lessonContent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lessonContent.toMap());

  // Add any Firestore field values
  lessonContent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonContentListFirestoreData(
  List<LessonContentStruct>? lessonContents,
) =>
    lessonContents
        ?.map((e) => getLessonContentFirestoreData(e, true))
        .toList() ??
    [];
