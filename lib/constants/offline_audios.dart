import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/common_domains/audio_offline_category.dart';

final List<AudioOfflineCategory> kOfflineAudioCategories = [
  AudioOfflineCategory(
    id: 'naturals',
    name: 'Âm thanh thiên nhiên',
    audios: [
      AudioOffline(
        id: 'rain',
        name: 'sounds.rain',
        image: 'assets/images/rain-forest.png',
      ),
      AudioOffline(
        id: 'forest',
        name: 'sounds.forest',
        image: 'assets/images/forest-with-birds.png',
      ),
      AudioOffline(
        id: 'wind',
        name: 'sounds.wind',
        image: 'assets/images/wind-and-peaceful.png',
      ),
      AudioOffline(
        id: 'fire',
        name: 'sounds.fire',
        image: 'assets/images/firecamp.png',
      ),
      AudioOffline(
        id: 'water',
        name: 'sounds.water',
        image: 'assets/images/water.png',
      ),
      AudioOffline(
        id: 'wave',
        name: 'sounds.wave',
        image: 'assets/images/wave.png',
      ),
      AudioOffline(
        id: 'thunderstorm',
        name: 'sounds.thunderstorm',
        image: 'assets/images/thunderstorm.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'babblingBrook',
        name: 'sounds.babblingBrook',
        image: 'assets/images/babbling-brook.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'waterfall',
        name: 'sounds.waterfall',
        image: 'assets/images/waterfall.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'leaveRustling',
        name: 'sounds.leaveRustling',
        image: 'assets/images/leave-rustling.png',
        isSubscriptionRequired: true,
      ),
    ],
  ),
  AudioOfflineCategory(
    id: 'soundColors',
    name: 'Màu sắc âm thanh',
    audios: [
      AudioOffline(
        id: 'whiteNoise',
        name: 'sounds.whiteNoise',
        image: 'assets/images/white-noise.png',
      ),
      AudioOffline(
        id: 'pinkNoise',
        name: 'sounds.pinkNoise',
        image: 'assets/images/pink-noise.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'brownNoise',
        name: 'sounds.brownNoise',
        image: 'assets/images/brown-noise.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'blueNoise',
        name: 'sounds.blueNoise',
        image: 'assets/images/blue-noise.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'violetNoise',
        name: 'sounds.violetNoise',
        image: 'assets/images/violet-noise.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'greyNoise',
        name: 'sounds.greyNoise',
        image: 'assets/images/grey-noise.png',
        isSubscriptionRequired: true,
      ),
    ],
  ),
  AudioOfflineCategory(
    id: 'waves',
    name: 'Sóng âm',
    audios: [
      AudioOffline(
        id: 'alphaWave',
        name: 'sounds.alphaWave',
        image: 'assets/images/alpha-wave.png',
      ),
      AudioOffline(
        id: 'deltaWave',
        name: 'sounds.deltaWave',
        image: 'assets/images/delta-wave.png',
      ),
      AudioOffline(
        id: 'thetaWave',
        name: 'sounds.thetaWave',
        image: 'assets/images/theta-wave.png',
      ),
      AudioOffline(
        id: 'betaWave',
        name: 'sounds.betaWave',
        image: 'assets/images/beta-wave.png',
      ),
      AudioOffline(
        id: 'gammaWave',
        name: 'sounds.gammaWave',
        image: 'assets/images/gamma-wave.png',
      ),
      AudioOffline(
        id: 'space',
        name: 'sounds.space',
        image: 'assets/images/sky.png',
      ),
      AudioOffline(
        id: 'tibetanBowl',
        name: 'sounds.tibetanBowl',
        image: 'assets/images/tibetan-bowl.png',
      ),
    ],
  ),
  AudioOfflineCategory(
    id: 'animals',
    name: 'Âm thanh động vật',
    audios: [
      AudioOffline(
        id: 'catPurring',
        name: 'sounds.catPurring',
        image: 'assets/images/cat-purring.png',
      ),
      AudioOffline(
        id: 'birdsChirping',
        name: 'sounds.birdsChirping',
        image: 'assets/images/birds-chirping.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'circketChirping',
        name: 'sounds.circketChirping',
        image: 'assets/images/cricket.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'frogCroaking',
        name: 'sounds.frogCroaking',
        image: 'assets/images/frog-croaking.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'whale',
        name: 'sounds.whale',
        image: 'assets/images/whale.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'dolphin',
        name: 'sounds.dolphin',
        image: 'assets/images/dolphin.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'horseNeighing',
        name: 'sounds.horseNeighing',
        image: 'assets/images/horse-neighing.png',
        isSubscriptionRequired: true,
      ),
      AudioOffline(
        id: 'wolveHowling',
        name: 'sounds.wolveHowling',
        image: 'assets/images/wolve-howling.png',
        isSubscriptionRequired: true,
      ),
    ],
  ),
];
