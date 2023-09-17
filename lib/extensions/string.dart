import 'package:daily_mind/common_domains/sound_item.dart';
import 'package:daily_mind/constants/sound_items.dart';

extension StringExt on String {
  SoundItem get soundItem => soundItems.firstWhere((item) => item.id == this);

  List<String> get toMapLocale => split("-");
}
