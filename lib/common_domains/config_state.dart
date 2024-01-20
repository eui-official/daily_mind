import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/artist.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/from_source.dart';
import 'package:daily_mind/common_domains/group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_state.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const ConfigState._();

  const factory ConfigState({
    required List<Artist> artists,
    required List<Category> categories,
    required List<FromSource> fromSources,
    required List<Group> groups,
    required bool isLoading,
  }) = _ConfigState;

  Artist? onGetArtistById(String? id) {
    return artists.firstWhereOrNull((artist) => artist.id == id);
  }
}
