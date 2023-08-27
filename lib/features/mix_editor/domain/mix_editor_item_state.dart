import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_editor_item_state.freezed.dart';

@freezed
class MixEditorItemState with _$MixEditorItemState {
  const factory MixEditorItemState({
    required String id,
    required double volume,
  }) = _MixEditorItemState;
}
