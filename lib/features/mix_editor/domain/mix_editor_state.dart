import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_editor_state.freezed.dart';

@freezed
class MixEditorState with _$MixEditorState {
  const factory MixEditorState({
    required List<MixEditorItemState> items,
  }) = _MixEditorState;
}
