import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/common_domains/offline_audio_category.dart';

final List<OfflineAudioCategory> kOfflineAudioCategories = [
  OfflineAudioCategory(
    id: 'naturals',
    title: 'Âm thanh thiên nhiên',
    offlineAudios: [
      OfflineAudio(
        id: 'rain',
        title: 'sounds.rain',
        image: 'assets/images/rain-forest.png',
      ),
      OfflineAudio(
        id: 'forest',
        title: 'sounds.forest',
        image: 'assets/images/forest-with-birds.png',
      ),
      OfflineAudio(
        id: 'wind',
        title: 'sounds.wind',
        image: 'assets/images/wind-and-peaceful.png',
      ),
      OfflineAudio(
        id: 'fire',
        title: 'sounds.fire',
        image: 'assets/images/firecamp.png',
      ),
      OfflineAudio(
        id: 'water',
        title: 'sounds.water',
        image: 'assets/images/water.png',
      ),
      OfflineAudio(
        id: 'wave',
        title: 'sounds.wave',
        image: 'assets/images/wave.png',
      ),
      OfflineAudio(
        id: 'thunderstorm',
        title: 'sounds.thunderstorm',
        image: 'assets/images/thunderstorm.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'babblingBrook',
        title: 'sounds.babblingBrook',
        image: 'assets/images/babbling-brook.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'waterfall',
        title: 'sounds.waterfall',
        image: 'assets/images/waterfall.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'leaveRustling',
        title: 'sounds.leaveRustling',
        image: 'assets/images/leave-rustling.png',
        isSubscriptionRequired: true,
      ),
    ],
  ),
  OfflineAudioCategory(
    id: 'soundColors',
    title: 'Màu sắc âm thanh',
    offlineAudios: [
      OfflineAudio(
        id: 'whiteNoise',
        title: 'sounds.whiteNoise',
        image: 'assets/images/white-noise.png',
      ),
      OfflineAudio(
        id: 'pinkNoise',
        title: 'sounds.pinkNoise',
        image: 'assets/images/pink-noise.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'brownNoise',
        title: 'sounds.brownNoise',
        image: 'assets/images/brown-noise.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'blueNoise',
        title: 'sounds.blueNoise',
        image: 'assets/images/blue-noise.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'violetNoise',
        title: 'sounds.violetNoise',
        image: 'assets/images/violet-noise.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'greyNoise',
        title: 'sounds.greyNoise',
        image: 'assets/images/grey-noise.png',
        isSubscriptionRequired: true,
      ),
    ],
  ),
  OfflineAudioCategory(
    id: 'waves',
    title: 'Sóng âm',
    offlineAudios: [
      OfflineAudio(
        id: 'alphaWave',
        title: 'sounds.alphaWave',
        image: 'assets/images/alpha-wave.png',
      ),
      OfflineAudio(
        id: 'deltaWave',
        title: 'sounds.deltaWave',
        image: 'assets/images/delta-wave.png',
      ),
      OfflineAudio(
        id: 'thetaWave',
        title: 'sounds.thetaWave',
        image: 'assets/images/theta-wave.png',
      ),
      OfflineAudio(
        id: 'betaWave',
        title: 'sounds.betaWave',
        image: 'assets/images/beta-wave.png',
      ),
      OfflineAudio(
        id: 'gammaWave',
        title: 'sounds.gammaWave',
        image: 'assets/images/gamma-wave.png',
      ),
      OfflineAudio(
        id: 'space',
        title: 'sounds.space',
        image: 'assets/images/sky.png',
      ),
      OfflineAudio(
        id: 'tibetanBowl',
        title: 'sounds.tibetanBowl',
        image: 'assets/images/tibetan-bowl.png',
      ),
    ],
  ),
  OfflineAudioCategory(
    id: 'animals',
    title: 'Âm thanh động vật',
    offlineAudios: [
      OfflineAudio(
        id: 'catPurring',
        title: 'sounds.catPurring',
        image: 'assets/images/cat-purring.png',
      ),
      OfflineAudio(
        id: 'birdsChirping',
        title: 'sounds.birdsChirping',
        image: 'assets/images/birds-chirping.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'circketChirping',
        title: 'sounds.circketChirping',
        image: 'assets/images/cricket.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'frogCroaking',
        title: 'sounds.frogCroaking',
        image: 'assets/images/frog-croaking.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'whale',
        title: 'sounds.whale',
        image: 'assets/images/whale.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'dolphin',
        title: 'sounds.dolphin',
        image: 'assets/images/dolphin.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'horseNeighing',
        title: 'sounds.horseNeighing',
        image: 'assets/images/horse-neighing.png',
        isSubscriptionRequired: true,
      ),
      OfflineAudio(
        id: 'wolveHowling',
        title: 'sounds.wolveHowling',
        image: 'assets/images/wolve-howling.png',
        isSubscriptionRequired: true,
      ),
    ],
  ),
];
