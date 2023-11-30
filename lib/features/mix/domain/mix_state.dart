import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_state.freezed.dart';

@freezed
class MixState with _$MixState {
  const MixState._();

  const factory MixState({
    required String title,
    MixCollection? recentMixCollection,
  }) = _MixState;
}
