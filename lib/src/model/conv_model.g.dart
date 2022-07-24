// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conv_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetConvModelCollection on Isar {
  IsarCollection<ConvModel> get convModels => getCollection();
}

const ConvModelSchema = CollectionSchema(
  name: 'ConvModel',
  schema:
      '{"name":"ConvModel","idName":"id","properties":[{"name":"convID","type":"String"},{"name":"draftModel","type":"String"},{"name":"isPinned","type":"Bool"},{"name":"maxSeq","type":"Long"},{"name":"minSeq","type":"Long"},{"name":"msgModel","type":"String"},{"name":"msgTime","type":"Long"},{"name":"unreadCount","type":"Long"}],"indexes":[{"name":"convID","unique":false,"properties":[{"name":"convID","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'convID': 0,
    'draftModel': 1,
    'isPinned': 2,
    'maxSeq': 3,
    'minSeq': 4,
    'msgModel': 5,
    'msgTime': 6,
    'unreadCount': 7
  },
  listProperties: {},
  indexIds: {'convID': 0},
  indexValueTypes: {
    'convID': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _convModelGetId,
  setId: _convModelSetId,
  getLinks: _convModelGetLinks,
  attachLinks: _convModelAttachLinks,
  serializeNative: _convModelSerializeNative,
  deserializeNative: _convModelDeserializeNative,
  deserializePropNative: _convModelDeserializePropNative,
  serializeWeb: _convModelSerializeWeb,
  deserializeWeb: _convModelDeserializeWeb,
  deserializePropWeb: _convModelDeserializePropWeb,
  version: 3,
);

int? _convModelGetId(ConvModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _convModelSetId(ConvModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _convModelGetLinks(ConvModel object) {
  return [];
}

const _convModelDraftConverter = DraftConverter();
const _convModelMsgConverter = MsgConverter();

void _convModelSerializeNative(
    IsarCollection<ConvModel> collection,
    IsarRawObject rawObj,
    ConvModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.convID;
  final _convID = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_convID.length) as int;
  final value1 = _convModelDraftConverter.toIsar(object.draftModel);
  final _draftModel = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_draftModel.length) as int;
  final value2 = object.isPinned;
  final _isPinned = value2;
  final value3 = object.maxSeq;
  final _maxSeq = value3;
  final value4 = object.minSeq;
  final _minSeq = value4;
  final value5 = _convModelMsgConverter.toIsar(object.msgModel);
  final _msgModel = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_msgModel.length) as int;
  final value6 = object.msgTime;
  final _msgTime = value6;
  final value7 = object.unreadCount;
  final _unreadCount = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _convID);
  writer.writeBytes(offsets[1], _draftModel);
  writer.writeBool(offsets[2], _isPinned);
  writer.writeLong(offsets[3], _maxSeq);
  writer.writeLong(offsets[4], _minSeq);
  writer.writeBytes(offsets[5], _msgModel);
  writer.writeLong(offsets[6], _msgTime);
  writer.writeLong(offsets[7], _unreadCount);
}

ConvModel _convModelDeserializeNative(IsarCollection<ConvModel> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = ConvModel(
    convID: reader.readString(offsets[0]),
    draftModel:
        _convModelDraftConverter.fromIsar(reader.readString(offsets[1])),
    isPinned: reader.readBool(offsets[2]),
    maxSeq: reader.readLong(offsets[3]),
    minSeq: reader.readLong(offsets[4]),
    msgModel: _convModelMsgConverter.fromIsar(reader.readString(offsets[5])),
    msgTime: reader.readLong(offsets[6]),
    unreadCount: reader.readLong(offsets[7]),
  );
  object.id = id;
  return object;
}

P _convModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_convModelDraftConverter.fromIsar(reader.readString(offset)))
          as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_convModelMsgConverter.fromIsar(reader.readString(offset))) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _convModelSerializeWeb(
    IsarCollection<ConvModel> collection, ConvModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'convID', object.convID);
  IsarNative.jsObjectSet(
      jsObj, 'draftModel', _convModelDraftConverter.toIsar(object.draftModel));
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isPinned', object.isPinned);
  IsarNative.jsObjectSet(jsObj, 'maxSeq', object.maxSeq);
  IsarNative.jsObjectSet(jsObj, 'minSeq', object.minSeq);
  IsarNative.jsObjectSet(
      jsObj, 'msgModel', _convModelMsgConverter.toIsar(object.msgModel));
  IsarNative.jsObjectSet(jsObj, 'msgTime', object.msgTime);
  IsarNative.jsObjectSet(jsObj, 'unreadCount', object.unreadCount);
  return jsObj;
}

ConvModel _convModelDeserializeWeb(
    IsarCollection<ConvModel> collection, dynamic jsObj) {
  final object = ConvModel(
    convID: IsarNative.jsObjectGet(jsObj, 'convID') ?? '',
    draftModel: _convModelDraftConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'draftModel') ?? ''),
    isPinned: IsarNative.jsObjectGet(jsObj, 'isPinned') ?? false,
    maxSeq: IsarNative.jsObjectGet(jsObj, 'maxSeq') ?? double.negativeInfinity,
    minSeq: IsarNative.jsObjectGet(jsObj, 'minSeq') ?? double.negativeInfinity,
    msgModel: _convModelMsgConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'msgModel') ?? ''),
    msgTime:
        IsarNative.jsObjectGet(jsObj, 'msgTime') ?? double.negativeInfinity,
    unreadCount:
        IsarNative.jsObjectGet(jsObj, 'unreadCount') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _convModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'convID':
      return (IsarNative.jsObjectGet(jsObj, 'convID') ?? '') as P;
    case 'draftModel':
      return (_convModelDraftConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'draftModel') ?? '')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'isPinned':
      return (IsarNative.jsObjectGet(jsObj, 'isPinned') ?? false) as P;
    case 'maxSeq':
      return (IsarNative.jsObjectGet(jsObj, 'maxSeq') ??
          double.negativeInfinity) as P;
    case 'minSeq':
      return (IsarNative.jsObjectGet(jsObj, 'minSeq') ??
          double.negativeInfinity) as P;
    case 'msgModel':
      return (_convModelMsgConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'msgModel') ?? '')) as P;
    case 'msgTime':
      return (IsarNative.jsObjectGet(jsObj, 'msgTime') ??
          double.negativeInfinity) as P;
    case 'unreadCount':
      return (IsarNative.jsObjectGet(jsObj, 'unreadCount') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _convModelAttachLinks(IsarCollection col, int id, ConvModel object) {}

extension ConvModelQueryWhereSort
    on QueryBuilder<ConvModel, ConvModel, QWhere> {
  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhere> anyConvID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convID'));
  }
}

extension ConvModelQueryWhere
    on QueryBuilder<ConvModel, ConvModel, QWhereClause> {
  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convIDEqualTo(
      String convID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convID',
      value: [convID],
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterWhereClause> convIDNotEqualTo(
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
}

extension ConvModelQueryFilter
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {
  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDEqualTo(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDGreaterThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDLessThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDStartsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDEndsWith(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> convIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelEqualTo(
    DraftModel? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      draftModelGreaterThan(
    DraftModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelLessThan(
    DraftModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelBetween(
    DraftModel? lower,
    DraftModel? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'draftModel',
      lower: _convModelDraftConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _convModelDraftConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      draftModelStartsWith(
    DraftModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelEndsWith(
    DraftModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelContains(
      DraftModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'draftModel',
      value: _convModelDraftConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> draftModelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'draftModel',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> isPinnedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isPinned',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> maxSeqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'maxSeq',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> maxSeqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'maxSeq',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> maxSeqLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'maxSeq',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> maxSeqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'maxSeq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> minSeqEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'minSeq',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> minSeqGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'minSeq',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> minSeqLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'minSeq',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> minSeqBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'minSeq',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelEqualTo(
    MsgModel? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'msgModel',
      value: _convModelMsgConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelGreaterThan(
    MsgModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'msgModel',
      value: _convModelMsgConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelLessThan(
    MsgModel? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'msgModel',
      value: _convModelMsgConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelBetween(
    MsgModel? lower,
    MsgModel? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'msgModel',
      lower: _convModelMsgConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _convModelMsgConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelStartsWith(
    MsgModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'msgModel',
      value: _convModelMsgConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelEndsWith(
    MsgModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'msgModel',
      value: _convModelMsgConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelContains(
      MsgModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'msgModel',
      value: _convModelMsgConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgModelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'msgModel',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgTimeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'msgTime',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'msgTime',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'msgTime',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> msgTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'msgTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition>
      unreadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'unreadCount',
      value: value,
    ));
  }

  QueryBuilder<ConvModel, ConvModel, QAfterFilterCondition> unreadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'unreadCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension ConvModelQueryLinks
    on QueryBuilder<ConvModel, ConvModel, QFilterCondition> {}

extension ConvModelQueryWhereSortBy
    on QueryBuilder<ConvModel, ConvModel, QSortBy> {
  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDraftModel() {
    return addSortByInternal('draftModel', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByDraftModelDesc() {
    return addSortByInternal('draftModel', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByIsPinned() {
    return addSortByInternal('isPinned', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByIsPinnedDesc() {
    return addSortByInternal('isPinned', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMaxSeq() {
    return addSortByInternal('maxSeq', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMaxSeqDesc() {
    return addSortByInternal('maxSeq', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMinSeq() {
    return addSortByInternal('minSeq', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMinSeqDesc() {
    return addSortByInternal('minSeq', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMsgModel() {
    return addSortByInternal('msgModel', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMsgModelDesc() {
    return addSortByInternal('msgModel', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMsgTime() {
    return addSortByInternal('msgTime', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByMsgTimeDesc() {
    return addSortByInternal('msgTime', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByUnreadCount() {
    return addSortByInternal('unreadCount', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> sortByUnreadCountDesc() {
    return addSortByInternal('unreadCount', Sort.desc);
  }
}

extension ConvModelQueryWhereSortThenBy
    on QueryBuilder<ConvModel, ConvModel, QSortThenBy> {
  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDraftModel() {
    return addSortByInternal('draftModel', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByDraftModelDesc() {
    return addSortByInternal('draftModel', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByIsPinned() {
    return addSortByInternal('isPinned', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByIsPinnedDesc() {
    return addSortByInternal('isPinned', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMaxSeq() {
    return addSortByInternal('maxSeq', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMaxSeqDesc() {
    return addSortByInternal('maxSeq', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMinSeq() {
    return addSortByInternal('minSeq', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMinSeqDesc() {
    return addSortByInternal('minSeq', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMsgModel() {
    return addSortByInternal('msgModel', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMsgModelDesc() {
    return addSortByInternal('msgModel', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMsgTime() {
    return addSortByInternal('msgTime', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByMsgTimeDesc() {
    return addSortByInternal('msgTime', Sort.desc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByUnreadCount() {
    return addSortByInternal('unreadCount', Sort.asc);
  }

  QueryBuilder<ConvModel, ConvModel, QAfterSortBy> thenByUnreadCountDesc() {
    return addSortByInternal('unreadCount', Sort.desc);
  }
}

extension ConvModelQueryWhereDistinct
    on QueryBuilder<ConvModel, ConvModel, QDistinct> {
  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByConvID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convID', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByDraftModel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('draftModel', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByIsPinned() {
    return addDistinctByInternal('isPinned');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByMaxSeq() {
    return addDistinctByInternal('maxSeq');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByMinSeq() {
    return addDistinctByInternal('minSeq');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByMsgModel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('msgModel', caseSensitive: caseSensitive);
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByMsgTime() {
    return addDistinctByInternal('msgTime');
  }

  QueryBuilder<ConvModel, ConvModel, QDistinct> distinctByUnreadCount() {
    return addDistinctByInternal('unreadCount');
  }
}

extension ConvModelQueryProperty
    on QueryBuilder<ConvModel, ConvModel, QQueryProperty> {
  QueryBuilder<ConvModel, String, QQueryOperations> convIDProperty() {
    return addPropertyNameInternal('convID');
  }

  QueryBuilder<ConvModel, DraftModel?, QQueryOperations> draftModelProperty() {
    return addPropertyNameInternal('draftModel');
  }

  QueryBuilder<ConvModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ConvModel, bool, QQueryOperations> isPinnedProperty() {
    return addPropertyNameInternal('isPinned');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> maxSeqProperty() {
    return addPropertyNameInternal('maxSeq');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> minSeqProperty() {
    return addPropertyNameInternal('minSeq');
  }

  QueryBuilder<ConvModel, MsgModel?, QQueryOperations> msgModelProperty() {
    return addPropertyNameInternal('msgModel');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> msgTimeProperty() {
    return addPropertyNameInternal('msgTime');
  }

  QueryBuilder<ConvModel, int, QQueryOperations> unreadCountProperty() {
    return addPropertyNameInternal('unreadCount');
  }
}
