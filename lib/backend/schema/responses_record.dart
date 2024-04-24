import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ResponsesRecord extends FirestoreRecord {
  ResponsesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Explanation" field.
  String? _explanation;
  String get explanation => _explanation ?? '';
  bool hasExplanation() => _explanation != null;

  // "QuestionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _explanation = snapshotData['Explanation'] as String?;
    _questionText = snapshotData['QuestionText'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Responses')
          : FirebaseFirestore.instance.collectionGroup('Responses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Responses').doc(id);

  static Stream<ResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponsesRecord.fromSnapshot(s));

  static Future<ResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponsesRecord.fromSnapshot(s));

  static ResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponsesRecordData({
  String? explanation,
  String? questionText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Explanation': explanation,
      'QuestionText': questionText,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponsesRecordDocumentEquality implements Equality<ResponsesRecord> {
  const ResponsesRecordDocumentEquality();

  @override
  bool equals(ResponsesRecord? e1, ResponsesRecord? e2) {
    return e1?.explanation == e2?.explanation &&
        e1?.questionText == e2?.questionText;
  }

  @override
  int hash(ResponsesRecord? e) =>
      const ListEquality().hash([e?.explanation, e?.questionText]);

  @override
  bool isValidKey(Object? o) => o is ResponsesRecord;
}
