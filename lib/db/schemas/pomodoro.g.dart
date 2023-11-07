// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPomodoroCollection on Isar {
  IsarCollection<Pomodoro> get pomodoros => this.collection();
}

const PomodoroSchema = CollectionSchema(
  name: r'Pomodoro',
  id: -5652193405469630749,
  properties: {
    r'audioId': PropertySchema(
      id: 0,
      name: r'audioId',
      type: IsarType.string,
    ),
    r'iconId': PropertySchema(
      id: 1,
      name: r'iconId',
      type: IsarType.string,
    ),
    r'longBreak': PropertySchema(
      id: 2,
      name: r'longBreak',
      type: IsarType.long,
    ),
    r'shortBreak': PropertySchema(
      id: 3,
      name: r'shortBreak',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'workingSessions': PropertySchema(
      id: 5,
      name: r'workingSessions',
      type: IsarType.long,
    )
  },
  estimateSize: _pomodoroEstimateSize,
  serialize: _pomodoroSerialize,
  deserialize: _pomodoroDeserialize,
  deserializeProp: _pomodoroDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pomodoroGetId,
  getLinks: _pomodoroGetLinks,
  attach: _pomodoroAttach,
  version: '3.1.0+1',
);

int _pomodoroEstimateSize(
  Pomodoro object,
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
  {
    final value = object.iconId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pomodoroSerialize(
  Pomodoro object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.audioId);
  writer.writeString(offsets[1], object.iconId);
  writer.writeLong(offsets[2], object.longBreak);
  writer.writeLong(offsets[3], object.shortBreak);
  writer.writeString(offsets[4], object.title);
  writer.writeLong(offsets[5], object.workingSessions);
}

Pomodoro _pomodoroDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pomodoro();
  object.audioId = reader.readStringOrNull(offsets[0]);
  object.iconId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.longBreak = reader.readLongOrNull(offsets[2]);
  object.shortBreak = reader.readLongOrNull(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  object.workingSessions = reader.readLongOrNull(offsets[5]);
  return object;
}

P _pomodoroDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pomodoroGetId(Pomodoro object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pomodoroGetLinks(Pomodoro object) {
  return [];
}

void _pomodoroAttach(IsarCollection<dynamic> col, Id id, Pomodoro object) {
  object.id = id;
}

extension PomodoroQueryWhereSort on QueryBuilder<Pomodoro, Pomodoro, QWhere> {
  QueryBuilder<Pomodoro, Pomodoro, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PomodoroQueryWhere on QueryBuilder<Pomodoro, Pomodoro, QWhereClause> {
  QueryBuilder<Pomodoro, Pomodoro, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterWhereClause> idBetween(
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

extension PomodoroQueryFilter
    on QueryBuilder<Pomodoro, Pomodoro, QFilterCondition> {
  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioId',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioId',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdEqualTo(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdGreaterThan(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdLessThan(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdBetween(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdStartsWith(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdEndsWith(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'audioId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'audioId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioId',
        value: '',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> audioIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'audioId',
        value: '',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconId',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconId',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconId',
        value: '',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> iconIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconId',
        value: '',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> longBreakIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longBreak',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> longBreakIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longBreak',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> longBreakEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> longBreakGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> longBreakLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> longBreakBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longBreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> shortBreakIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shortBreak',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      shortBreakIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shortBreak',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> shortBreakEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> shortBreakGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> shortBreakLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortBreak',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> shortBreakBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortBreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      workingSessionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workingSessions',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      workingSessionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workingSessions',
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      workingSessionsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workingSessions',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      workingSessionsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workingSessions',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      workingSessionsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workingSessions',
        value: value,
      ));
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterFilterCondition>
      workingSessionsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workingSessions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PomodoroQueryObject
    on QueryBuilder<Pomodoro, Pomodoro, QFilterCondition> {}

extension PomodoroQueryLinks
    on QueryBuilder<Pomodoro, Pomodoro, QFilterCondition> {}

extension PomodoroQuerySortBy on QueryBuilder<Pomodoro, Pomodoro, QSortBy> {
  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByAudioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByAudioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByLongBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreak', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByLongBreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreak', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByShortBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreak', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByShortBreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreak', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByWorkingSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingSessions', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> sortByWorkingSessionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingSessions', Sort.desc);
    });
  }
}

extension PomodoroQuerySortThenBy
    on QueryBuilder<Pomodoro, Pomodoro, QSortThenBy> {
  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByAudioId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByAudioIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioId', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByLongBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreak', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByLongBreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longBreak', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByShortBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreak', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByShortBreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortBreak', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByWorkingSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingSessions', Sort.asc);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QAfterSortBy> thenByWorkingSessionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingSessions', Sort.desc);
    });
  }
}

extension PomodoroQueryWhereDistinct
    on QueryBuilder<Pomodoro, Pomodoro, QDistinct> {
  QueryBuilder<Pomodoro, Pomodoro, QDistinct> distinctByAudioId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QDistinct> distinctByIconId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QDistinct> distinctByLongBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longBreak');
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QDistinct> distinctByShortBreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortBreak');
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Pomodoro, Pomodoro, QDistinct> distinctByWorkingSessions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workingSessions');
    });
  }
}

extension PomodoroQueryProperty
    on QueryBuilder<Pomodoro, Pomodoro, QQueryProperty> {
  QueryBuilder<Pomodoro, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pomodoro, String?, QQueryOperations> audioIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioId');
    });
  }

  QueryBuilder<Pomodoro, String?, QQueryOperations> iconIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconId');
    });
  }

  QueryBuilder<Pomodoro, int?, QQueryOperations> longBreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longBreak');
    });
  }

  QueryBuilder<Pomodoro, int?, QQueryOperations> shortBreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortBreak');
    });
  }

  QueryBuilder<Pomodoro, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Pomodoro, int?, QQueryOperations> workingSessionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workingSessions');
    });
  }
}
