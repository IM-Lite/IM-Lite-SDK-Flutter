// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetReadModelCollection on Isar {
  IsarCollection<ReadModel> get readModels => getCollection();
}

const ReadModelSchema = CollectionSchema(
  name: 'ReadModel',
  schema:
      '{"name":"ReadModel","idName":"id","properties":[{"name":"convID","type":"String"},{"name":"senderID","type":"String"},{"name":"seq","type":"Long"}],"indexes":[{"name":"convID","unique":false,"properties":[{"name":"convID","type":"Hash","caseSensitive":true}]},{"name":"senderID","unique":false,"properties":[{"name":"senderID","type":"Hash","caseSensitive":true}]}],"links":[]}',
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
  getId: _readModelGetId,
  setId: _readModelSetId,
  getLinks: _readModelGetLinks,
  attachLinks: _readModelAttachLinks,
  serializeNative: _readModelSerializeNative,
  deserializeNative: _readModelDeserializeNative,
  deserializePropNative: _readModelDeserializePropNative,
  serializeWeb: _readModelSerializeWeb,
  deserializeWeb: _readModelDeserializeWeb,
  deserializePropWeb: _readModelDeserializePropWeb,
  version: 3,
);

int? _readModelGetId(ReadModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _readModelSetId(ReadModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _readModelGetLinks(ReadModel object) {
  return [];
}

void _readModelSerializeNative(
    IsarCollection<ReadModel> collection,
    IsarRawObject rawObj,
    ReadModel object,
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

ReadModel _readModelDeserializeNative(IsarCollection<ReadModel> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = ReadModel(
    convID: reader.readString(offsets[0]),
    senderID: reader.readString(offsets[1]),
    seq: reader.readLong(offsets[2]),
  );
  object.id = id;
  return object;
}

P _readModelDeserializePropNative<P>(
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

dynamic _readModelSerializeWeb(
    IsarCollection<ReadModel> collection, ReadModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'convID', object.convID);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'senderID', object.senderID);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  return jsObj;
}

ReadModel _readModelDeserializeWeb(
    IsarCollection<ReadModel> collection, dynamic jsObj) {
  final object = ReadModel(
    convID: IsarNative.jsObjectGet(jsObj, 'convID') ?? '',
    senderID: IsarNative.jsObjectGet(jsObj, 'senderID') ?? '',
    seq: IsarNative.jsObjectGet(jsObj, 'seq') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _readModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
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

void _readModelAttachLinks(IsarCollection col, int id, ReadModel object) {}

extension ReadModelQueryWhereSort
    on QueryBuilder<ReadModel, ReadModel, QWhere> {
  QueryBuilder<ReadModel, ReadModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhere> anyConvID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convID'));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhere> anySenderID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'senderID'));
  }
}

extension ReadModelQueryWhere
    on QueryBuilder<ReadModel, ReadModel, QWhereClause> {
  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> convIDEqualTo(
      String convID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convID',
      value: [convID],
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> convIDNotEqualTo(
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

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> senderIDEqualTo(
      String senderID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'senderID',
      value: [senderID],
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterWhereClause> senderIDNotEqualTo(
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

extension ReadModelQueryFilter
    on QueryBuilder<ReadModel, ReadModel, QFilterCondition> {
  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDEqualTo(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDStartsWith(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDEndsWith(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> convIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDEqualTo(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDBetween(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDStartsWith(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDEndsWith(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> senderIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqGreaterThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqLessThan(
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

  QueryBuilder<ReadModel, ReadModel, QAfterFilterCondition> seqBetween(
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

extension ReadModelQueryLinks
    on QueryBuilder<ReadModel, ReadModel, QFilterCondition> {}

extension ReadModelQueryWhereSortBy
    on QueryBuilder<ReadModel, ReadModel, QSortBy> {
  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySenderID() {
    return addSortByInternal('senderID', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySenderIDDesc() {
    return addSortByInternal('senderID', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }
}

extension ReadModelQueryWhereSortThenBy
    on QueryBuilder<ReadModel, ReadModel, QSortThenBy> {
  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySenderID() {
    return addSortByInternal('senderID', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySenderIDDesc() {
    return addSortByInternal('senderID', Sort.desc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<ReadModel, ReadModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }
}

extension ReadModelQueryWhereDistinct
    on QueryBuilder<ReadModel, ReadModel, QDistinct> {
  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctByConvID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convID', caseSensitive: caseSensitive);
  }

  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctBySenderID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderID', caseSensitive: caseSensitive);
  }

  QueryBuilder<ReadModel, ReadModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }
}

extension ReadModelQueryProperty
    on QueryBuilder<ReadModel, ReadModel, QQueryProperty> {
  QueryBuilder<ReadModel, String, QQueryOperations> convIDProperty() {
    return addPropertyNameInternal('convID');
  }

  QueryBuilder<ReadModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ReadModel, String, QQueryOperations> senderIDProperty() {
    return addPropertyNameInternal('senderID');
  }

  QueryBuilder<ReadModel, int, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }
}
