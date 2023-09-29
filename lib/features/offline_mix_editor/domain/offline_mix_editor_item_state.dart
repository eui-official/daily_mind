import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_mix_editor_item_state.freezed.dart';

@freezed
class OfflineMixEditorItemState with _$OfflineMixEditorItemState {
  const factory OfflineMixEditorItemState({
    required String id,
    required double volume,
  }) = _OfflineMixEditorItemState;
}
