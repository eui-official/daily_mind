import 'package:freezed_annotation/freezed_annotation.dart';

part 'from_source.freezed.dart';
part 'from_source.g.dart';

@freezed
class FromSource with _$FromSource {
  const factory FromSource({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    required String name,
    required String website,
  }) = _FromSource;

  factory FromSource.fromJson(Map<String, dynamic> json) =>
      _$FromSourceFromJson(json);
}
