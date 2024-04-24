import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "courseTitle" field.
  String? _courseTitle;
  String get courseTitle => _courseTitle ?? '';
  bool hasCourseTitle() => _courseTitle != null;

  // "courseDescription" field.
  String? _courseDescription;
  String get courseDescription => _courseDescription ?? '';
  bool hasCourseDescription() => _courseDescription != null;

  // "simpleCourseDescription" field.
  String? _simpleCourseDescription;
  String get simpleCourseDescription => _simpleCourseDescription ?? '';
  bool hasSimpleCourseDescription() => _simpleCourseDescription != null;

  // "modules" field.
  List<ModulesStruct>? _modules;
  List<ModulesStruct> get modules => _modules ?? const [];
  bool hasModules() => _modules != null;

  void _initializeFields() {
    _courseTitle = snapshotData['courseTitle'] as String?;
    _courseDescription = snapshotData['courseDescription'] as String?;
    _simpleCourseDescription =
        snapshotData['simpleCourseDescription'] as String?;
    _modules = getStructList(
      snapshotData['modules'],
      ModulesStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? courseTitle,
  String? courseDescription,
  String? simpleCourseDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'courseTitle': courseTitle,
      'courseDescription': courseDescription,
      'simpleCourseDescription': simpleCourseDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.courseTitle == e2?.courseTitle &&
        e1?.courseDescription == e2?.courseDescription &&
        e1?.simpleCourseDescription == e2?.simpleCourseDescription &&
        listEquality.equals(e1?.modules, e2?.modules);
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.courseTitle,
        e?.courseDescription,
        e?.simpleCourseDescription,
        e?.modules
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
