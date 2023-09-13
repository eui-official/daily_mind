import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/list_sounds/domain/sound_card.dart';

extension StringExt on String {
  SoundItem get soundItem => soundItems.firstWhere((item) => item.id == this);

  List<String> get toMapLocale => split("-");
}
