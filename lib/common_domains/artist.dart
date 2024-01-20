import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  const factory Artist({
    required String name,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}
