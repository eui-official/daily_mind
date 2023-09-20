import 'package:daily_mind/common_applications/base_audio_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final yt = YoutubeExplode();

class YoutubeAudioPlayer extends BaseAudioPlayer {
  void play(String source) async {
    final info = await yt.videos.get(VideoId(source));

    if (info.isLive) {
      final url = await yt.videos.streams.getHttpLiveStreamUrl(VideoId(source));
      await audioPlayer.setUrl(url);
    } else {
      final manifest = await yt.videos.streams.getManifest(VideoId(source));
      final audio = manifest.audioOnly.first;
      final url = audio.url.toString();

      await audioPlayer.setUrl(url);
    }

    await audioPlayer.play();
  }

  void stop() async {
    await audioPlayer.stop();
  }
}
