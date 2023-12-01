// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_playlist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOnlinePlaylistCollection on Isar {
  IsarCollection<OnlinePlaylist> get onlinePlaylists => this.collection();
}

const OnlinePlaylistSchema = CollectionSchema(
  name: r'OnlinePlaylist',
  id: -4007078794584416932,
  properties: {
    r'itemIds': PropertySchema(
      id: 0,
      name: r'itemIds',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 1,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _onlinePlaylistEstimateSize,
  serialize: _onlinePlaylistSerialize,
  deserialize: _onlinePlaylistDeserialize,
  deserializeProp: _onlinePlaylistDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _onlinePlaylistGetId,
  getLinks: _onlinePlaylistGetLinks,
  attach: _onlinePlaylistAttach,
  version: '3.1.0+1',
);

int _onlinePlaylistEstimateSize(
  OnlinePlaylist object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.itemIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
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

void _onlinePlaylistSerialize(
  OnlinePlaylist object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.itemIds);
  writer.writeString(offsets[1], object.title);
}

OnlinePlaylist _onlinePlaylistDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OnlinePlaylist();
  object.id = id;
  object.itemIds = reader.readStringList(offsets[0]);
  object.title = reader.readStringOrNull(offsets[1]);
  return object;
}

P _onlinePlaylistDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _onlinePlaylistGetId(OnlinePlaylist object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _onlinePlaylistGetLinks(OnlinePlaylist object) {
  return [];
}

void _onlinePlaylistAttach(
    IsarCollection<dynamic> col, Id id, OnlinePlaylist object) {
  object.id = id;
}

extension OnlinePlaylistQueryWhereSort
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QWhere> {
  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OnlinePlaylistQueryWhere
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QWhereClause> {
  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterWhereClause> idBetween(
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

extension OnlinePlaylistQueryFilter
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QFilterCondition> {
  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemIds',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemIds',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemIds',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      itemIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'itemIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleEqualTo(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleLessThan(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleBetween(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension OnlinePlaylistQueryObject
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QFilterCondition> {}

extension OnlinePlaylistQueryLinks
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QFilterCondition> {}

extension OnlinePlaylistQuerySortBy
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QSortBy> {
  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension OnlinePlaylistQuerySortThenBy
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QSortThenBy> {
  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension OnlinePlaylistQueryWhereDistinct
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QDistinct> {
  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QDistinct> distinctByItemIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemIds');
    });
  }

  QueryBuilder<OnlinePlaylist, OnlinePlaylist, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension OnlinePlaylistQueryProperty
    on QueryBuilder<OnlinePlaylist, OnlinePlaylist, QQueryProperty> {
  QueryBuilder<OnlinePlaylist, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OnlinePlaylist, List<String>?, QQueryOperations>
      itemIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemIds');
    });
  }

  QueryBuilder<OnlinePlaylist, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
