import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supported_theme.freezed.dart';

@freezed
class SupportedTheme with _$SupportedTheme {
  const factory SupportedTheme({
    required String id,
    required String title,
    required FlexScheme scheme,
  }) = _SupportedTheme;
}
