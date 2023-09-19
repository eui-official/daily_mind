import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:flutter/material.dart';

typedef OnItemVolumeChanged = Function(
  MixEditorItemState state,
  double volume,
);

typedef OnWidgetSettingBuilder = Widget Function(Settings?);

typedef OnEmptyWidgetBuilder<T> = Widget Function(T data);

typedef OnListSoundBuilder = Widget Function(
  BuildContext context,
  List<SoundOnlineItem> listItem,
);

typedef OnSoundBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  T item,
);

typedef OnSoundOfflineStateBuilder = Function(
  GaplessAudioPlayer audioPlayer,
  bool isLoading,
  bool isPlaying,
);
