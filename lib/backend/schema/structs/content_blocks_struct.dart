// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentBlocksStruct extends FFFirebaseStruct {
  ContentBlocksStruct({
    String? type,
    bool? highlight,
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _highlight = highlight,
        _content = content,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "highlight" field.
  bool? _highlight;
  bool get highlight => _highlight ?? false;
  set highlight(bool? val) => _highlight = val;
  bool hasHighlight() => _highlight != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  static ContentBlocksStruct fromMap(Map<String, dynamic> data) =>
      ContentBlocksStruct(
        type: data['type'] as String?,
        highlight: data['highlight'] as bool?,
        content: data['content'] as String?,
      );

  static ContentBlocksStruct? maybeFromMap(dynamic data) => data is Map
      ? ContentBlocksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'highlight': _highlight,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'highlight': serializeParam(
          _highlight,
          ParamType.bool,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContentBlocksStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentBlocksStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        highlight: deserializeParam(
          data['highlight'],
          ParamType.bool,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContentBlocksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentBlocksStruct &&
        type == other.type &&
        highlight == other.highlight &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([type, highlight, content]);
}

ContentBlocksStruct createContentBlocksStruct({
  String? type,
  bool? highlight,
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentBlocksStruct(
      type: type,
      highlight: highlight,
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentBlocksStruct? updateContentBlocksStruct(
  ContentBlocksStruct? contentBlocks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contentBlocks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentBlocksStructData(
  Map<String, dynamic> firestoreData,
  ContentBlocksStruct? contentBlocks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contentBlocks == null) {
    return;
  }
  if (contentBlocks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contentBlocks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentBlocksData =
      getContentBlocksFirestoreData(contentBlocks, forFieldValue);
  final nestedData =
      contentBlocksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contentBlocks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentBlocksFirestoreData(
  ContentBlocksStruct? contentBlocks, [
  bool forFieldValue = false,
]) {
  if (contentBlocks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contentBlocks.toMap());

  // Add any Firestore field values
  contentBlocks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentBlocksListFirestoreData(
  List<ContentBlocksStruct>? contentBlockss,
) =>
    contentBlockss
        ?.map((e) => getContentBlocksFirestoreData(e, true))
        .toList() ??
    [];
