import 'package:daily_mind/common_domains/offline_audio.dart';

final List<OfflineAudio> kOfflineWakeUpAudios = [
  OfflineAudio(
    id: 'birds',
    title: 'audios.birds',
    image: 'assets/images/birds.png',
    sources: [
      'assets/wake_up_audios/birds.mp3',
    ],
  ),
  OfflineAudio(
    id: 'ocean',
    title: 'audios.ocean',
    image: 'assets/images/ocean.png',
    sources: [
      'assets/wake_up_audios/ocean.mp3',
    ],
  ),
  OfflineAudio(
    id: 'starDust',
    title: 'audios.starDust',
    image: 'assets/images/brown-noise.png',
    sources: [
      'assets/wake_up_audios/starDust.mp3',
    ],
  ),
];
