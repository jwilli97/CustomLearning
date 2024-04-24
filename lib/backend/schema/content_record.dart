import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ContentRecord extends FirestoreRecord {
  ContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "Highlight" field.
  bool? _highlight;
  bool get highlight => _highlight ?? false;
  bool hasHighlight() => _highlight != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['Text'] as String?;
    _highlight = snapshotData['Highlight'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Content')
          : FirebaseFirestore.instance.collectionGroup('Content');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Content').doc(id);

  static Stream<ContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentRecord.fromSnapshot(s));

  static Future<ContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentRecord.fromSnapshot(s));

  static ContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentRecordData({
  String? text,
  bool? highlight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Text': text,
      'Highlight': highlight,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentRecordDocumentEquality implements Equality<ContentRecord> {
  const ContentRecordDocumentEquality();

  @override
  bool equals(ContentRecord? e1, ContentRecord? e2) {
    return e1?.text == e2?.text && e1?.highlight == e2?.highlight;
  }

  @override
  int hash(ContentRecord? e) =>
      const ListEquality().hash([e?.text, e?.highlight]);

  @override
  bool isValidKey(Object? o) => o is ContentRecord;
}
