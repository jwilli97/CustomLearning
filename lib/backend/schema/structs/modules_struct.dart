// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModulesStruct extends FFFirebaseStruct {
  ModulesStruct({
    String? moduleName,
    String? moduleDescription,
    List<LessonContentStruct>? lessonContent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _moduleName = moduleName,
        _moduleDescription = moduleDescription,
        _lessonContent = lessonContent,
        super(firestoreUtilData);

  // "moduleName" field.
  String? _moduleName;
  String get moduleName => _moduleName ?? '';
  set moduleName(String? val) => _moduleName = val;
  bool hasModuleName() => _moduleName != null;

  // "moduleDescription" field.
  String? _moduleDescription;
  String get moduleDescription => _moduleDescription ?? '';
  set moduleDescription(String? val) => _moduleDescription = val;
  bool hasModuleDescription() => _moduleDescription != null;

  // "lessonContent" field.
  List<LessonContentStruct>? _lessonContent;
  List<LessonContentStruct> get lessonContent => _lessonContent ?? const [];
  set lessonContent(List<LessonContentStruct>? val) => _lessonContent = val;
  void updateLessonContent(Function(List<LessonContentStruct>) updateFn) =>
      updateFn(_lessonContent ??= []);
  bool hasLessonContent() => _lessonContent != null;

  static ModulesStruct fromMap(Map<String, dynamic> data) => ModulesStruct(
        moduleName: data['moduleName'] as String?,
        moduleDescription: data['moduleDescription'] as String?,
        lessonContent: getStructList(
          data['lessonContent'],
          LessonContentStruct.fromMap,
        ),
      );

  static ModulesStruct? maybeFromMap(dynamic data) =>
      data is Map ? ModulesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'moduleName': _moduleName,
        'moduleDescription': _moduleDescription,
        'lessonContent': _lessonContent?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'moduleName': serializeParam(
          _moduleName,
          ParamType.String,
        ),
        'moduleDescription': serializeParam(
          _moduleDescription,
          ParamType.String,
        ),
        'lessonContent': serializeParam(
          _lessonContent,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ModulesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ModulesStruct(
        moduleName: deserializeParam(
          data['moduleName'],
          ParamType.String,
          false,
        ),
        moduleDescription: deserializeParam(
          data['moduleDescription'],
          ParamType.String,
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
  String toString() => 'ModulesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ModulesStruct &&
        moduleName == other.moduleName &&
        moduleDescription == other.moduleDescription &&
        listEquality.equals(lessonContent, other.lessonContent);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([moduleName, moduleDescription, lessonContent]);
}

ModulesStruct createModulesStruct({
  String? moduleName,
  String? moduleDescription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModulesStruct(
      moduleName: moduleName,
      moduleDescription: moduleDescription,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModulesStruct? updateModulesStruct(
  ModulesStruct? modules, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    modules
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModulesStructData(
  Map<String, dynamic> firestoreData,
  ModulesStruct? modules,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modules == null) {
    return;
  }
  if (modules.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && modules.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modulesData = getModulesFirestoreData(modules, forFieldValue);
  final nestedData = modulesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = modules.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModulesFirestoreData(
  ModulesStruct? modules, [
  bool forFieldValue = false,
]) {
  if (modules == null) {
    return {};
  }
  final firestoreData = mapToFirestore(modules.toMap());

  // Add any Firestore field values
  modules.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModulesListFirestoreData(
  List<ModulesStruct>? moduless,
) =>
    moduless?.map((e) => getModulesFirestoreData(e, true)).toList() ?? [];
