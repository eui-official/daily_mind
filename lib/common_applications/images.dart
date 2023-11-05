import 'dart:math';

final listBackground = [
  'assets/images/background/1.jpg',
  'assets/images/background/2.jpg',
  'assets/images/background/3.jpg',
  'assets/images/background/4.jpg',
  'assets/images/background/5.jpg',
];

class Images {
  String get onGetRandomBackground =>
      listBackground[Random().nextInt(listBackground.length)];
}

final images = Images();
