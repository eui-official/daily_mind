import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_item_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_mix_editor_state.freezed.dart';

@freezed
class OfflineMixEditorState with _$OfflineMixEditorState {
  const factory OfflineMixEditorState({
    required List<OfflineMixEditorItemState> offlineMixEditorItemStates,
  }) = _OfflineMixEditorState;
}
