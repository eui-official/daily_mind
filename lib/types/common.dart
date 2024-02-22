import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:flutter/material.dart';

typedef OfflineAudioSources = Map<String, List<String>>;

typedef OnWidgetSettingBuilder = Widget Function(Settings?);

typedef OnWidgetBuilder<T> = Widget Function(T data);

typedef OnListItemBuilder<T> = Widget Function(
  BuildContext context,
  List<T>,
);

typedef OnItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

typedef OnValueBuilder<T> = Function(BuildContext context, T value);

typedef OnAudiosBuilder = Widget Function(List<Audio> audios);

typedef OnItemIndexBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  T item,
);

typedef OnSoundOfflineStateBuilder = Function(
  GaplessAudioPlayer gaplessAudioPlayer,
  bool isLoading,
  bool isPlaying,
);

typedef OnFunctionHandlerBuilder = Widget Function(VoidCallback onTap);

typedef AudioCategoryGroup = Map<String?, List<AudioCategory>>;

typedef OnCounting = Function(int remainingSeconds);

typedef OnAudioSelected = Function(dynamic audio, String audioFrom);
