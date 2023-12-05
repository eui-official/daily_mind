import 'package:daily_mind/common_domains/audio.dart';

List<Audio> onToAudios(dynamic rawAudios) {
  List<Audio> audios = [];

  for (final audio in rawAudios) {
    audios.add(Audio.fromJson(audio));
  }

  return audios;
}
