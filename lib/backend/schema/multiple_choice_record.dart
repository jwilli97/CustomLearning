import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MultipleChoiceRecord extends FirestoreRecord {
  MultipleChoiceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "QuestionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  // "Explanations" field.
  String? _explanations;
  String get explanations => _explanations ?? '';
  bool hasExplanations() => _explanations != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _questionText = snapshotData['QuestionText'] as String?;
    _explanations = snapshotData['Explanations'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MultipleChoice')
          : FirebaseFirestore.instance.collectionGroup('MultipleChoice');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('MultipleChoice').doc(id);

  static Stream<MultipleChoiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MultipleChoiceRecord.fromSnapshot(s));

  static Future<MultipleChoiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MultipleChoiceRecord.fromSnapshot(s));

  static MultipleChoiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MultipleChoiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MultipleChoiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MultipleChoiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MultipleChoiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MultipleChoiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMultipleChoiceRecordData({
  String? questionText,
  String? explanations,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'QuestionText': questionText,
      'Explanations': explanations,
    }.withoutNulls,
  );

  return firestoreData;
}

class MultipleChoiceRecordDocumentEquality
    implements Equality<MultipleChoiceRecord> {
  const MultipleChoiceRecordDocumentEquality();

  @override
  bool equals(MultipleChoiceRecord? e1, MultipleChoiceRecord? e2) {
    return e1?.questionText == e2?.questionText &&
        e1?.explanations == e2?.explanations;
  }

  @override
  int hash(MultipleChoiceRecord? e) =>
      const ListEquality().hash([e?.questionText, e?.explanations]);

  @override
  bool isValidKey(Object? o) => o is MultipleChoiceRecord;
}
