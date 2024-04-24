import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GapAnalysisRecord extends FirestoreRecord {
  GapAnalysisRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gap_analysis');

  static Stream<GapAnalysisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GapAnalysisRecord.fromSnapshot(s));

  static Future<GapAnalysisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GapAnalysisRecord.fromSnapshot(s));

  static GapAnalysisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GapAnalysisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GapAnalysisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GapAnalysisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GapAnalysisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GapAnalysisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGapAnalysisRecordData({
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class GapAnalysisRecordDocumentEquality implements Equality<GapAnalysisRecord> {
  const GapAnalysisRecordDocumentEquality();

  @override
  bool equals(GapAnalysisRecord? e1, GapAnalysisRecord? e2) {
    return e1?.userId == e2?.userId;
  }

  @override
  int hash(GapAnalysisRecord? e) => const ListEquality().hash([e?.userId]);

  @override
  bool isValidKey(Object? o) => o is GapAnalysisRecord;
}
