// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msg_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMsgModelCollection on Isar {
  IsarCollection<MsgModel> get msgModels => getCollection();
}

const MsgModelSchema = CollectionSchema(
  name: 'MsgModel',
  schema:
      '{"name":"MsgModel","idName":"id","properties":[{"name":"clientMsgID","type":"String"},{"name":"clientTime","type":"Long"},{"name":"content","type":"String"},{"name":"contentType","type":"Long"},{"name":"convID","type":"String"},{"name":"msgOptions","type":"String"},{"name":"offlinePush","type":"String"},{"name":"sendStatus","type":"Long"},{"name":"senderID","type":"String"},{"name":"seq","type":"Long"},{"name":"serverMsgID","type":"String"},{"name":"serverTime","type":"Long"}],"indexes":[{"name":"clientMsgID","unique":false,"properties":[{"name":"clientMsgID","type":"Hash","caseSensitive":true}]},{"name":"content","unique":false,"properties":[{"name":"content","type":"Hash","caseSensitive":true}]},{"name":"contentType","unique":false,"properties":[{"name":"contentType","type":"Value","caseSensitive":false}]},{"name":"convID","unique":false,"properties":[{"name":"convID","type":"Hash","caseSensitive":true}]},{"name":"senderID","unique":false,"properties":[{"name":"senderID","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'clientMsgID': 0,
    'clientTime': 1,
    'content': 2,
    'contentType': 3,
    'convID': 4,
    'msgOptions': 5,
    'offlinePush': 6,
    'sendStatus': 7,
    'senderID': 8,
    'seq': 9,
    'serverMsgID': 10,
    'serverTime': 11
  },
  listProperties: {},
  indexIds: {
    'clientMsgID': 0,
    'content': 1,
    'contentType': 2,
    'convID': 3,
    'senderID': 4
  },
  indexValueTypes: {
    'clientMsgID': [
      IndexValueType.stringHash,
    ],
    'content': [
      IndexValueType.stringHash,
    ],
    'contentType': [
      IndexValueType.long,
    ],
    'convID': [
      IndexValueType.stringHash,
    ],
    'senderID': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _msgModelGetId,
  setId: _msgModelSetId,
  getLinks: _msgModelGetLinks,
  attachLinks: _msgModelAttachLinks,
  serializeNative: _msgModelSerializeNative,
  deserializeNative: _msgModelDeserializeNative,
  deserializePropNative: _msgModelDeserializePropNative,
  serializeWeb: _msgModelSerializeWeb,
  deserializeWeb: _msgModelDeserializeWeb,
  deserializePropWeb: _msgModelDeserializePropWeb,
  version: 3,
);

int? _msgModelGetId(MsgModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _msgModelSetId(MsgModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _msgModelGetLinks(MsgModel object) {
  return [];
}

const _msgModelMsgOptionsConverter = MsgOptionsConverter();
const _msgModelOfflinePushConverter = OfflinePushConverter();

void _msgModelSerializeNative(
    IsarCollection<MsgModel> collection,
    IsarRawObject rawObj,
    MsgModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.clientMsgID;
  final _clientMsgID = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_clientMsgID.length) as int;
  final value1 = object.clientTime;
  final _clientTime = value1;
  final value2 = object.content;
  final _content = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_content.length) as int;
  final value3 = object.contentType;
  final _contentType = value3;
  final value4 = object.convID;
  final _convID = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_convID.length) as int;
  final value5 = _msgModelMsgOptionsConverter.toIsar(object.msgOptions);
  final _msgOptions = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_msgOptions.length) as int;
  final value6 = _msgModelOfflinePushConverter.toIsar(object.offlinePush);
  final _offlinePush = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_offlinePush.length) as int;
  final value7 = object.sendStatus;
  final _sendStatus = value7;
  final value8 = object.senderID;
  final _senderID = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_senderID.length) as int;
  final value9 = object.seq;
  final _seq = value9;
  final value10 = object.serverMsgID;
  IsarUint8List? _serverMsgID;
  if (value10 != null) {
    _serverMsgID = IsarBinaryWriter.utf8Encoder.convert(value10);
  }
  dynamicSize += (_serverMsgID?.length ?? 0) as int;
  final value11 = object.serverTime;
  final _serverTime = value11;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _clientMsgID);
  writer.writeLong(offsets[1], _clientTime);
  writer.writeBytes(offsets[2], _content);
  writer.writeLong(offsets[3], _contentType);
  writer.writeBytes(offsets[4], _convID);
  writer.writeBytes(offsets[5], _msgOptions);
  writer.writeBytes(offsets[6], _offlinePush);
  writer.writeLong(offsets[7], _sendStatus);
  writer.writeBytes(offsets[8], _senderID);
  writer.writeLong(offsets[9], _seq);
  writer.writeBytes(offsets[10], _serverMsgID);
  writer.writeLong(offsets[11], _serverTime);
}

MsgModel _msgModelDeserializeNative(IsarCollection<MsgModel> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = MsgModel(
    clientMsgID: reader.readString(offsets[0]),
    clientTime: reader.readLong(offsets[1]),
    content: reader.readString(offsets[2]),
    contentType: reader.readLong(offsets[3]),
    convID: reader.readString(offsets[4]),
    msgOptions:
        _msgModelMsgOptionsConverter.fromIsar(reader.readString(offsets[5])),
    offlinePush:
        _msgModelOfflinePushConverter.fromIsar(reader.readString(offsets[6])),
    sendStatus: reader.readLong(offsets[7]),
    senderID: reader.readString(offsets[8]),
    seq: reader.readLongOrNull(offsets[9]),
    serverMsgID: reader.readStringOrNull(offsets[10]),
    serverTime: reader.readLong(offsets[11]),
  );
  object.id = id;
  return object;
}

P _msgModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_msgModelMsgOptionsConverter.fromIsar(reader.readString(offset)))
          as P;
    case 6:
      return (_msgModelOfflinePushConverter.fromIsar(reader.readString(offset)))
          as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _msgModelSerializeWeb(
    IsarCollection<MsgModel> collection, MsgModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'clientMsgID', object.clientMsgID);
  IsarNative.jsObjectSet(jsObj, 'clientTime', object.clientTime);
  IsarNative.jsObjectSet(jsObj, 'content', object.content);
  IsarNative.jsObjectSet(jsObj, 'contentType', object.contentType);
  IsarNative.jsObjectSet(jsObj, 'convID', object.convID);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'msgOptions',
      _msgModelMsgOptionsConverter.toIsar(object.msgOptions));
  IsarNative.jsObjectSet(jsObj, 'offlinePush',
      _msgModelOfflinePushConverter.toIsar(object.offlinePush));
  IsarNative.jsObjectSet(jsObj, 'sendStatus', object.sendStatus);
  IsarNative.jsObjectSet(jsObj, 'senderID', object.senderID);
  IsarNative.jsObjectSet(jsObj, 'seq', object.seq);
  IsarNative.jsObjectSet(jsObj, 'serverMsgID', object.serverMsgID);
  IsarNative.jsObjectSet(jsObj, 'serverTime', object.serverTime);
  return jsObj;
}

MsgModel _msgModelDeserializeWeb(
    IsarCollection<MsgModel> collection, dynamic jsObj) {
  final object = MsgModel(
    clientMsgID: IsarNative.jsObjectGet(jsObj, 'clientMsgID') ?? '',
    clientTime:
        IsarNative.jsObjectGet(jsObj, 'clientTime') ?? double.negativeInfinity,
    content: IsarNative.jsObjectGet(jsObj, 'content') ?? '',
    contentType:
        IsarNative.jsObjectGet(jsObj, 'contentType') ?? double.negativeInfinity,
    convID: IsarNative.jsObjectGet(jsObj, 'convID') ?? '',
    msgOptions: _msgModelMsgOptionsConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'msgOptions') ?? ''),
    offlinePush: _msgModelOfflinePushConverter
        .fromIsar(IsarNative.jsObjectGet(jsObj, 'offlinePush') ?? ''),
    sendStatus:
        IsarNative.jsObjectGet(jsObj, 'sendStatus') ?? double.negativeInfinity,
    senderID: IsarNative.jsObjectGet(jsObj, 'senderID') ?? '',
    seq: IsarNative.jsObjectGet(jsObj, 'seq'),
    serverMsgID: IsarNative.jsObjectGet(jsObj, 'serverMsgID'),
    serverTime:
        IsarNative.jsObjectGet(jsObj, 'serverTime') ?? double.negativeInfinity,
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  return object;
}

P _msgModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'clientMsgID':
      return (IsarNative.jsObjectGet(jsObj, 'clientMsgID') ?? '') as P;
    case 'clientTime':
      return (IsarNative.jsObjectGet(jsObj, 'clientTime') ??
          double.negativeInfinity) as P;
    case 'content':
      return (IsarNative.jsObjectGet(jsObj, 'content') ?? '') as P;
    case 'contentType':
      return (IsarNative.jsObjectGet(jsObj, 'contentType') ??
          double.negativeInfinity) as P;
    case 'convID':
      return (IsarNative.jsObjectGet(jsObj, 'convID') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'msgOptions':
      return (_msgModelMsgOptionsConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'msgOptions') ?? '')) as P;
    case 'offlinePush':
      return (_msgModelOfflinePushConverter
          .fromIsar(IsarNative.jsObjectGet(jsObj, 'offlinePush') ?? '')) as P;
    case 'sendStatus':
      return (IsarNative.jsObjectGet(jsObj, 'sendStatus') ??
          double.negativeInfinity) as P;
    case 'senderID':
      return (IsarNative.jsObjectGet(jsObj, 'senderID') ?? '') as P;
    case 'seq':
      return (IsarNative.jsObjectGet(jsObj, 'seq')) as P;
    case 'serverMsgID':
      return (IsarNative.jsObjectGet(jsObj, 'serverMsgID')) as P;
    case 'serverTime':
      return (IsarNative.jsObjectGet(jsObj, 'serverTime') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _msgModelAttachLinks(IsarCollection col, int id, MsgModel object) {}

extension MsgModelQueryWhereSort on QueryBuilder<MsgModel, MsgModel, QWhere> {
  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyClientMsgID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'clientMsgID'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyContent() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'content'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyContentType() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'contentType'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anyConvID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'convID'));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhere> anySenderID() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'senderID'));
  }
}

extension MsgModelQueryWhere on QueryBuilder<MsgModel, MsgModel, QWhereClause> {
  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> clientMsgIDEqualTo(
      String clientMsgID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'clientMsgID',
      value: [clientMsgID],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> clientMsgIDNotEqualTo(
      String clientMsgID) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'clientMsgID',
        upper: [clientMsgID],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'clientMsgID',
        lower: [clientMsgID],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'clientMsgID',
        lower: [clientMsgID],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'clientMsgID',
        upper: [clientMsgID],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentEqualTo(
      String content) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'content',
      value: [content],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentNotEqualTo(
      String content) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'content',
        upper: [content],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'content',
        lower: [content],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'content',
        lower: [content],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'content',
        upper: [content],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeEqualTo(
      int contentType) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'contentType',
      value: [contentType],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeNotEqualTo(
      int contentType) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'contentType',
        upper: [contentType],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'contentType',
        lower: [contentType],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'contentType',
        lower: [contentType],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'contentType',
        upper: [contentType],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeGreaterThan(
    int contentType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'contentType',
      lower: [contentType],
      includeLower: include,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeLessThan(
    int contentType, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'contentType',
      upper: [contentType],
      includeUpper: include,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> contentTypeBetween(
    int lowerContentType,
    int upperContentType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'contentType',
      lower: [lowerContentType],
      includeLower: includeLower,
      upper: [upperContentType],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> convIDEqualTo(
      String convID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'convID',
      value: [convID],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> convIDNotEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> senderIDEqualTo(
      String senderID) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'senderID',
      value: [senderID],
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterWhereClause> senderIDNotEqualTo(
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

extension MsgModelQueryFilter
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {
  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      clientMsgIDGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'clientMsgID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'clientMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientMsgIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'clientMsgID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'clientTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> clientTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'clientTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'content',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'content',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      contentTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'contentType',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> contentTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'contentType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'convID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> convIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'convID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsEqualTo(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'msgOptions',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsGreaterThan(
    MsgOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'msgOptions',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsLessThan(
    MsgOptionsModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'msgOptions',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsBetween(
    MsgOptionsModel lower,
    MsgOptionsModel upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'msgOptions',
      lower: _msgModelMsgOptionsConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _msgModelMsgOptionsConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsStartsWith(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'msgOptions',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsEndsWith(
    MsgOptionsModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'msgOptions',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsContains(
      MsgOptionsModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'msgOptions',
      value: _msgModelMsgOptionsConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> msgOptionsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'msgOptions',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushEqualTo(
    OfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'offlinePush',
      value: _msgModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      offlinePushGreaterThan(
    OfflinePushModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'offlinePush',
      value: _msgModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushLessThan(
    OfflinePushModel value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'offlinePush',
      value: _msgModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushBetween(
    OfflinePushModel lower,
    OfflinePushModel upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'offlinePush',
      lower: _msgModelOfflinePushConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _msgModelOfflinePushConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushStartsWith(
    OfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'offlinePush',
      value: _msgModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushEndsWith(
    OfflinePushModel value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'offlinePush',
      value: _msgModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushContains(
      OfflinePushModel value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'offlinePush',
      value: _msgModelOfflinePushConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> offlinePushMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'offlinePush',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sendStatus',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> sendStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sendStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDEqualTo(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDGreaterThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDLessThan(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDBetween(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDStartsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDEndsWith(
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'senderID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> senderIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'senderID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'seq',
      value: null,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'seq',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> seqBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'serverMsgID',
      value: null,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition>
      serverMsgIDGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'serverMsgID',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'serverMsgID',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverMsgIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'serverMsgID',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'serverTime',
      value: value,
    ));
  }

  QueryBuilder<MsgModel, MsgModel, QAfterFilterCondition> serverTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'serverTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension MsgModelQueryLinks
    on QueryBuilder<MsgModel, MsgModel, QFilterCondition> {}

extension MsgModelQueryWhereSortBy
    on QueryBuilder<MsgModel, MsgModel, QSortBy> {
  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientMsgID() {
    return addSortByInternal('clientMsgID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientMsgIDDesc() {
    return addSortByInternal('clientMsgID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientTime() {
    return addSortByInternal('clientTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByClientTimeDesc() {
    return addSortByInternal('clientTime', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByMsgOptions() {
    return addSortByInternal('msgOptions', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByMsgOptionsDesc() {
    return addSortByInternal('msgOptions', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByOfflinePush() {
    return addSortByInternal('offlinePush', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByOfflinePushDesc() {
    return addSortByInternal('offlinePush', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendStatus() {
    return addSortByInternal('sendStatus', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySendStatusDesc() {
    return addSortByInternal('sendStatus', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderID() {
    return addSortByInternal('senderID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySenderIDDesc() {
    return addSortByInternal('senderID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerMsgID() {
    return addSortByInternal('serverMsgID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerMsgIDDesc() {
    return addSortByInternal('serverMsgID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerTime() {
    return addSortByInternal('serverTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> sortByServerTimeDesc() {
    return addSortByInternal('serverTime', Sort.desc);
  }
}

extension MsgModelQueryWhereSortThenBy
    on QueryBuilder<MsgModel, MsgModel, QSortThenBy> {
  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientMsgID() {
    return addSortByInternal('clientMsgID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientMsgIDDesc() {
    return addSortByInternal('clientMsgID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientTime() {
    return addSortByInternal('clientTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByClientTimeDesc() {
    return addSortByInternal('clientTime', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentType() {
    return addSortByInternal('contentType', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByContentTypeDesc() {
    return addSortByInternal('contentType', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByConvID() {
    return addSortByInternal('convID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByConvIDDesc() {
    return addSortByInternal('convID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByMsgOptions() {
    return addSortByInternal('msgOptions', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByMsgOptionsDesc() {
    return addSortByInternal('msgOptions', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByOfflinePush() {
    return addSortByInternal('offlinePush', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByOfflinePushDesc() {
    return addSortByInternal('offlinePush', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendStatus() {
    return addSortByInternal('sendStatus', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySendStatusDesc() {
    return addSortByInternal('sendStatus', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderID() {
    return addSortByInternal('senderID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySenderIDDesc() {
    return addSortByInternal('senderID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySeq() {
    return addSortByInternal('seq', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenBySeqDesc() {
    return addSortByInternal('seq', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerMsgID() {
    return addSortByInternal('serverMsgID', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerMsgIDDesc() {
    return addSortByInternal('serverMsgID', Sort.desc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerTime() {
    return addSortByInternal('serverTime', Sort.asc);
  }

  QueryBuilder<MsgModel, MsgModel, QAfterSortBy> thenByServerTimeDesc() {
    return addSortByInternal('serverTime', Sort.desc);
  }
}

extension MsgModelQueryWhereDistinct
    on QueryBuilder<MsgModel, MsgModel, QDistinct> {
  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByClientMsgID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('clientMsgID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByClientTime() {
    return addDistinctByInternal('clientTime');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('content', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByContentType() {
    return addDistinctByInternal('contentType');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByConvID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('convID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByMsgOptions(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('msgOptions', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByOfflinePush(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('offlinePush', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySendStatus() {
    return addDistinctByInternal('sendStatus');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySenderID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('senderID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctBySeq() {
    return addDistinctByInternal('seq');
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByServerMsgID(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('serverMsgID', caseSensitive: caseSensitive);
  }

  QueryBuilder<MsgModel, MsgModel, QDistinct> distinctByServerTime() {
    return addDistinctByInternal('serverTime');
  }
}

extension MsgModelQueryProperty
    on QueryBuilder<MsgModel, MsgModel, QQueryProperty> {
  QueryBuilder<MsgModel, String, QQueryOperations> clientMsgIDProperty() {
    return addPropertyNameInternal('clientMsgID');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> clientTimeProperty() {
    return addPropertyNameInternal('clientTime');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> contentProperty() {
    return addPropertyNameInternal('content');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> contentTypeProperty() {
    return addPropertyNameInternal('contentType');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> convIDProperty() {
    return addPropertyNameInternal('convID');
  }

  QueryBuilder<MsgModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<MsgModel, MsgOptionsModel, QQueryOperations>
      msgOptionsProperty() {
    return addPropertyNameInternal('msgOptions');
  }

  QueryBuilder<MsgModel, OfflinePushModel, QQueryOperations>
      offlinePushProperty() {
    return addPropertyNameInternal('offlinePush');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> sendStatusProperty() {
    return addPropertyNameInternal('sendStatus');
  }

  QueryBuilder<MsgModel, String, QQueryOperations> senderIDProperty() {
    return addPropertyNameInternal('senderID');
  }

  QueryBuilder<MsgModel, int?, QQueryOperations> seqProperty() {
    return addPropertyNameInternal('seq');
  }

  QueryBuilder<MsgModel, String?, QQueryOperations> serverMsgIDProperty() {
    return addPropertyNameInternal('serverMsgID');
  }

  QueryBuilder<MsgModel, int, QQueryOperations> serverTimeProperty() {
    return addPropertyNameInternal('serverTime');
  }
}
