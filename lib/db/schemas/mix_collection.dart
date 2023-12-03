import 'package:isar/isar.dart';

part 'mix_collection.g.dart';

@collection
class MixCollection {
  Id id = Isar.autoIncrement;

  String? title;

  List<MixCollectionItemInfo>? items;
}

@embedded
class MixCollectionItemInfo {
  late String id;

  late double volume;
}
