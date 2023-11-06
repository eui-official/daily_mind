import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_icon.freezed.dart';

@freezed
class FocusIcon with _$FocusIcon {
  const factory FocusIcon({
    required String icon,
    required String id,
  }) = _FocusIcon;
}
