// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlarmHistoryCollection on Isar {
  IsarCollection<AlarmHistory> get alarmHistorys => this.collection();
}

const AlarmHistorySchema = CollectionSchema(
  name: r'AlarmHistory',
  id: -1463096488341244298,
  properties: {
    r'audioId': PropertySchema(
      id: 0,
      name: r'audioId',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 1,
      name: r'endTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _alarmHistoryEstimateSize,
  serialize: _alarmHistorySerialize,
  deserialize: _alarmHistoryDeserialize,
  deserializeProp: _alarmHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _alarmHistoryGetId,
  getLinks: _alarmHistoryGetLinks,
  attach: _alarmHistoryAttach,
  version: '3.1.0+1',
);

int _alarmHistoryEstimateSize(
  AlarmHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.audioId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _alarmHistorySerialize(
  AlarmHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.audioId);
  writer.writeDateTime(offsets[1], object.endTime);
}

AlarmHistory _alarmHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlarmHistory();
  object.audioId = reader.readStringOrNull(offsets[0]);
  object.endTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  return object;
}

P _alarmHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _alarmHistoryGetId(AlarmHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _alarmHistoryGetLinks(AlarmHistory object) {
  return [];
}

void _alarmHistoryAttach(
    IsarCollection<dynamic> col, Id id, AlarmHistory object) {
  object.id = id;
}

extension AlarmHistoryQueryWhereSort
    on QueryBuilder<AlarmHistory, AlarmHistory, QWhere> {
  QueryBuilder<AlarmHistory, AlarmHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlarmHistoryQueryWhere
    on QueryBuilder<AlarmHistory, AlarmHistory, QWhereClause> {
  QueryBuilder<AlarmHistory, AlarmHistory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AlarmHistoryQueryFilter
    on QueryBuilder<AlarmHistory, AlarmHistory, QFilterCondition> {
  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioId',
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioId',
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'audioId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'audioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioId',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      audioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'audioId',
        value: '',
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AlarmHistoryQueryObject
    on QueryBuilder<AlarmHistory, AlarmHistory, QFilterCondition> {}

extension AlarmHistoryQueryLinks
    on QueryBuilder<AlarmHistory, AlarmHistory, QFilterCondition> {}

extension AlarmHistoryQuerySortBy
    on QueryBuilder<AlarmHistory, AlarmHistory, QSortBy> {
  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> sortByAudioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> sortByAudioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }
}

extension AlarmHistoryQuerySortThenBy
    on QueryBuilder<AlarmHistory, AlarmHistory, QSortThenBy> {
  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> thenByAudioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> thenByAudioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AlarmHistoryQueryWhereDistinct
    on QueryBuilder<AlarmHistory, AlarmHistory, QDistinct> {
  QueryBuilder<AlarmHistory, AlarmHistory, QDistinct> distinctByAudioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlarmHistory, AlarmHistory, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }
}

extension AlarmHistoryQueryProperty
    on QueryBuilder<AlarmHistory, AlarmHistory, QQueryProperty> {
  QueryBuilder<AlarmHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AlarmHistory, String?, QQueryOperations> audioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioId');
    });
  }

  QueryBuilder<AlarmHistory, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }
}
