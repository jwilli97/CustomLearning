import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MultipleChoiceQuestionsRecord extends FirestoreRecord {
  MultipleChoiceQuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "lessonId" field.
  DocumentReference? _lessonId;
  DocumentReference? get lessonId => _lessonId;
  bool hasLessonId() => _lessonId != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _lessonId = snapshotData['lessonId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('multiple_choice_questions');

  static Stream<MultipleChoiceQuestionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => MultipleChoiceQuestionsRecord.fromSnapshot(s));

  static Future<MultipleChoiceQuestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MultipleChoiceQuestionsRecord.fromSnapshot(s));

  static MultipleChoiceQuestionsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      MultipleChoiceQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MultipleChoiceQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MultipleChoiceQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MultipleChoiceQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MultipleChoiceQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMultipleChoiceQuestionsRecordData({
  String? question,
  DocumentReference? lessonId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'lessonId': lessonId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MultipleChoiceQuestionsRecordDocumentEquality
    implements Equality<MultipleChoiceQuestionsRecord> {
  const MultipleChoiceQuestionsRecordDocumentEquality();

  @override
  bool equals(
      MultipleChoiceQuestionsRecord? e1, MultipleChoiceQuestionsRecord? e2) {
    return e1?.question == e2?.question && e1?.lessonId == e2?.lessonId;
  }

  @override
  int hash(MultipleChoiceQuestionsRecord? e) =>
      const ListEquality().hash([e?.question, e?.lessonId]);

  @override
  bool isValidKey(Object? o) => o is MultipleChoiceQuestionsRecord;
}
