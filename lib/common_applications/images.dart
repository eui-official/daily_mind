import 'dart:math';

final listBackground = [
  'assets/images/firecamp.png',
  'assets/images/forest-with-birds.png',
  'assets/images/forest.png',
  'assets/images/rain-forest.png',
  'assets/images/red-forest.png',
  'assets/images/sky.png',
  'assets/images/water.png',
  'assets/images/wind-and-peaceful.png',
];

class Images {
  String get randomBackground =>
      listBackground[Random().nextInt(listBackground.length)];
}

final images = Images();
