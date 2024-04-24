import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "lessonName" field.
  String? _lessonName;
  String get lessonName => _lessonName ?? '';
  bool hasLessonName() => _lessonName != null;

  // "moduleName" field.
  String? _moduleName;
  String get moduleName => _moduleName ?? '';
  bool hasModuleName() => _moduleName != null;

  // "chapter" field.
  int? _chapter;
  int get chapter => _chapter ?? 0;
  bool hasChapter() => _chapter != null;

  // "lessonContent" field.
  List<LessonContentStruct>? _lessonContent;
  List<LessonContentStruct> get lessonContent => _lessonContent ?? const [];
  bool hasLessonContent() => _lessonContent != null;

  // "courseContent" field.
  List<LessonContentStruct>? _courseContent;
  List<LessonContentStruct> get courseContent => _courseContent ?? const [];
  bool hasCourseContent() => _courseContent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _lessonName = snapshotData['lessonName'] as String?;
    _moduleName = snapshotData['moduleName'] as String?;
    _chapter = castToType<int>(snapshotData['chapter']);
    _lessonContent = getStructList(
      snapshotData['lessonContent'],
      LessonContentStruct.fromMap,
    );
    _courseContent = getStructList(
      snapshotData['courseContent'],
      LessonContentStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Lessons')
          : FirebaseFirestore.instance.collectionGroup('Lessons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Lessons').doc(id);

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  String? lessonName,
  String? moduleName,
  int? chapter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lessonName': lessonName,
      'moduleName': moduleName,
      'chapter': chapter,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.lessonName == e2?.lessonName &&
        e1?.moduleName == e2?.moduleName &&
        e1?.chapter == e2?.chapter &&
        listEquality.equals(e1?.lessonContent, e2?.lessonContent) &&
        listEquality.equals(e1?.courseContent, e2?.courseContent);
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality().hash([
        e?.lessonName,
        e?.moduleName,
        e?.chapter,
        e?.lessonContent,
        e?.courseContent
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
