import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ContentBlocksRecord extends FirestoreRecord {
  ContentBlocksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Content" field.
  List<DocumentReference>? _content;
  List<DocumentReference> get content => _content ?? const [];
  bool hasContent() => _content != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['Type'] as String?;
    _content = getDataList(snapshotData['Content']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ContentBlocks')
          : FirebaseFirestore.instance.collectionGroup('ContentBlocks');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ContentBlocks').doc(id);

  static Stream<ContentBlocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentBlocksRecord.fromSnapshot(s));

  static Future<ContentBlocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentBlocksRecord.fromSnapshot(s));

  static ContentBlocksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentBlocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentBlocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentBlocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentBlocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentBlocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentBlocksRecordData({
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentBlocksRecordDocumentEquality
    implements Equality<ContentBlocksRecord> {
  const ContentBlocksRecordDocumentEquality();

  @override
  bool equals(ContentBlocksRecord? e1, ContentBlocksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        listEquality.equals(e1?.content, e2?.content);
  }

  @override
  int hash(ContentBlocksRecord? e) =>
      const ListEquality().hash([e?.type, e?.content]);

  @override
  bool isValidKey(Object? o) => o is ContentBlocksRecord;
}
