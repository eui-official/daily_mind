import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/common_domains/audio_offline_category.dart';

final List<AudioOfflineCategory> kOfflineAudioCategories = [
  AudioOfflineCategory(
    id: 'naturals',
    name: 'Âm thanh thiên nhiên',
    audios: [
      AudioOffline(
        id: 'rain',
        name: 'rain',
        image: 'assets/images/rain-forest.png',
      ),
      AudioOffline(
        id: 'forest',
        name: 'forest',
        image: 'assets/images/forest-with-birds.png',
      ),
      AudioOffline(
        id: 'wind',
        name: 'wind',
        image: 'assets/images/wind-and-peaceful.png',
      ),
      AudioOffline(
        id: 'fire',
        name: 'fire',
        image: 'assets/images/firecamp.png',
      ),
      AudioOffline(
        id: 'water',
        name: 'water',
        image: 'assets/images/water.png',
      ),
      AudioOffline(
        id: 'wave',
        name: 'wave',
        image: 'assets/images/wave.png',
      ),
      AudioOffline(
        id: 'thunderstorm',
        name: 'thunderstorm',
        image: 'assets/images/thunderstorm.png',
      ),
    ],
  ),
  AudioOfflineCategory(
    id: 'soundColors',
    name: 'Màu sắc âm thanh',
    audios: [
      AudioOffline(
        id: 'whiteNoise',
        name: 'whiteNoise',
        image: 'assets/images/white-noise.png',
      ),
    ],
  ),
  AudioOfflineCategory(
    id: 'waves',
    name: 'Sóng âm',
    audios: [
      AudioOffline(
        id: 'space',
        name: 'space',
        image: 'assets/images/sky.png',
      ),
      AudioOffline(
        id: 'deltaWave',
        name: 'deltaWave',
        image: 'assets/images/delta-wave.png',
      ),
    ],
  ),
  AudioOfflineCategory(
    id: 'animals',
    name: 'Âm thanh động vật',
    audios: [
      AudioOffline(
        id: 'catPurring',
        name: 'catPurring',
        image: 'assets/images/cat-purring.png',
      ),
      AudioOffline(
        id: 'birdsChirping',
        name: 'birdsChirping',
        image: 'assets/images/birds-chirping.png',
      ),
    ],
  ),
];
