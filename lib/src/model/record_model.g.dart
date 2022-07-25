// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRecordModelCollection on Isar {
  IsarCollection<RecordModel> get recordModels => getCollection();
}

const RecordModelSchema = CollectionSchema(
  name: 'RecordModel',
  schema:
      '{"name":"RecordModel","idName":"id","properties":[{"name":"convID","type":"String"},{"name":"senderID","type":"String"},{"name":"seq","type":"Long"}],"indexes":[{"name":"convID","unique":false,"properties":[{"name":"convID","type":"Hash","caseSensitive":true}]},{"name":"senderID","unique":false,"properties":[{"name":"senderID","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'convID': 0, 'senderID': 1, 'seq': 2},
  listProperties: {},
  indexIds: {'convID': 0, 'senderID': 1},
  indexValueTypes: {
    'convID': [
      IndexValueType.stringHash,
    ],
    'senderID': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _recordModelGetId,
  setId: _recordModelSetId,
  getLinks: _recordModelGetLinks,
  attachLinks: _recordModelAttachLinks,
  serializeNative: _recordModelSerializeNative,
  deserializeNative: _recordModelDeserializeNative,
  deserializePropNative: _recordModelDeserializePropNative,
  serializeWeb: _recordModelSerializeWeb,
  deserializeWeb: _recordModelDeserializeWeb,
  deserializePropWeb: _recordModelDeserializePropWeb,
  version: 3,
);

int? _recordModelGetId(RecordModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _recordModelSetId(RecordModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _recordModelGetLinks(RecordModel object) {
  return [];
}

void _recordModelSerializeNative(
    IsarCollection<RecordModel> collection,
    IsarRawObject rawObj,
    RecordModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.convID;
  final _convID = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_convID.length) as int;
  final value1 = object.senderID;
  final _senderID = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_senderID.length) as int;
  final value2 = object.seq;
  final _seq = value2;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _convID);
  writer.writeBytes(offsets[1], _senderID);
  writer.writeLong(offsets[2], _seq);
}

RecordModel _recordModelDeserializeNative(
    IsarCollection<RecordModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RecordModel(
    convID: reader.readString(offsets[0]),
    senderID: reader.readString(offsets[1]),
    seq: reader.readLong(offsets[2]),
  );
  object.id = id;
  return object;
}

P _recordModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _recordModelSerializeWeb(
    IsarCollection<RecordModel> collection, RecordModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'convID', object.convID);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'senderID', object.senderID);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  return jsObj;
}

RecordModel _recordModelDeserializeWeb(
    IsarCollection<RecordModel> collection, dynamic jsObj) {
  final object = RecordModel(
    convID: IsarNative.jsObjectGet(jsObj, 'convID') ?? '',
    senderID: IsarNative.jsObjectGet(jsObj, 'senderID') ?? '',
    seq: IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _recordModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'convID':
      return (IsarNative.jsObjectGet(jsObj, 'convID') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'senderID':
      return (IsarNative.jsObjectGet(jsObj, 'senderID') ?? '') as P;
    case 'seq':
      return (IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _recordModelAttachLinks(IsarCollection col, int id, RecordModel object) {}

extension RecordModelQueryWhereSort
    on QueryBuilder<RecordModel, RecordModel, QWhere> {
  QueryBuilder<RecordModel, RecordModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhere> anyConvID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convID'));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhere> anySenderID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'senderID'));
  }
}

extension RecordModelQueryWhere
    on QueryBuilder<RecordModel, RecordModel, QWhereClause> {
  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> convIDEqualTo(
      String convID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convID',
      value: [convID],
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> convIDNotEqualTo(
      String convID) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'convID',
        upper: [convID],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'convID',
        lower: [convID],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'convID',
        lower: [convID],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'convID',
        upper: [convID],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> senderIDEqualTo(
      String senderID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'senderID',
      value: [senderID],
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterWhereClause> senderIDNotEqualTo(
      String senderID) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'senderID',
        upper: [senderID],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'senderID',
        lower: [senderID],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'senderID',
        lower: [senderID],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'senderID',
        upper: [senderID],
        includeUpper: false,
      ));
    }
  }
}

extension RecordModelQueryFilter
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {
  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'convID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      convIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> convIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> senderIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      senderIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      senderIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> senderIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'senderID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      senderIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      senderIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition>
      senderIDContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> senderIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<RecordModel, RecordModel, QAfterFilterCondition> seqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'seq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension RecordModelQueryLinks
    on QueryBuilder<RecordModel, RecordModel, QFilterCondition> {}

extension RecordModelQueryWhereSortBy
    on QueryBuilder<RecordModel, RecordModel, QSortBy> {
  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySenderID() {
    return addSortByInternal('senderID', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySenderIDDesc() {
    return addSortByInternal('senderID', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }
}

extension RecordModelQueryWhereSortThenBy
    on QueryBuilder<RecordModel, RecordModel, QSortThenBy> {
  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySenderID() {
    return addSortByInternal('senderID', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySenderIDDesc() {
    return addSortByInternal('senderID', Sort.desc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<RecordModel, RecordModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }
}

extension RecordModelQueryWhereDistinct
    on QueryBuilder<RecordModel, RecordModel, QDistinct> {
  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctByConvID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convID', caseSensitive: caseSensitive);
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctBySenderID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderID', caseSensitive: caseSensitive);
  }

  QueryBuilder<RecordModel, RecordModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }
}

extension RecordModelQueryProperty
    on QueryBuilder<RecordModel, RecordModel, QQueryProperty> {
  QueryBuilder<RecordModel, String, QQueryOperations> convIDProperty() {
    return addPropertyNameInternal('convID');
  }

  QueryBuilder<RecordModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<RecordModel, String, QQueryOperations> senderIDProperty() {
    return addPropertyNameInternal('senderID');
  }

  QueryBuilder<RecordModel, int, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }
}
