import 'package:daily_mind/features/list_sounds/domain/sound_card.dart';
import 'package:easy_localization/easy_localization.dart';

final List<SoundItem> soundItems = [
  SoundItem(
    id: 'rain',
    name: 'rain'.tr(),
    image: 'assets/images/rain-forest.png',
  ),
  SoundItem(
    id: 'forest',
    name: 'forest'.tr(),
    image: 'assets/images/forest-with-birds.png',
  ),
  SoundItem(
    id: 'wind',
    name: 'wind'.tr(),
    image: 'assets/images/wind-and-peaceful.png',
  ),
  SoundItem(
    id: 'fire',
    name: 'fire'.tr(),
    image: 'assets/images/firecamp.png',
  ),
  SoundItem(
    id: 'water',
    name: 'water'.tr(),
    image: 'assets/images/water.png',
  ),
  SoundItem(
    id: 'space',
    name: 'space'.tr(),
    image: 'assets/images/sky.png',
  ),
];
