import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mix_conllections_provider.g.dart';

@riverpod
class MixCollectionsNotifier extends _$MixCollectionsNotifier {
  @override
  List<MixCollection> build() {
    onStreamAllMixCollections();

    return db.onGetAllMixCollections();
  }

  void onStreamAllMixCollections() {
    db.onStreamAllMixCollections().listen((mixCollections) {
      state = mixCollections;
    });
  }
}
