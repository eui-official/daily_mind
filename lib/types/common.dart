import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:daily_mind/features/offline_mix_editor/domain/offline_mix_editor_item_state.dart';
import 'package:flutter/material.dart';

typedef OnItemVolumeChanged = Function(
  OfflineMixEditorItemState offlineMixEditorItemState,
  double volume,
);

typedef OnWidgetSettingBuilder = Widget Function(Settings?);

typedef OnEmptyWidgetBuilder<T> = Widget Function(T data);

typedef OnListItemBuilder<T> = Widget Function(
  BuildContext context,
  List<T>,
);

typedef OnItemBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  T item,
);

typedef OnSoundOfflineStateBuilder = Function(
  GaplessAudioPlayer audioPlayer,
  bool isLoading,
  bool isPlaying,
);
