import 'package:daily_mind/features/mix_editor/domain/mix_editor_item_state.dart';
import 'package:flutter/material.dart';

typedef OnItemVolumeChanged = Function(
  MixEditorItemState itemState,
  double volume,
);

typedef OnEmptyWidgetBuilder<T> = Widget Function(T data);
