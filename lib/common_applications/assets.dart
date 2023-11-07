import 'dart:io';

import 'package:daily_mind/extensions/string.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<Uri> onGetSoundImageFromAsset(String id) async {
  final offlineAudioItem = id.offlineAudioItem;

  final byteData = await rootBundle.load(offlineAudioItem.image);
  final buffer = byteData.buffer;
  Directory tempDir = await getApplicationDocumentsDirectory();

  String tempPath = tempDir.path;
  var filePath = '$tempPath/daily-mind-art.png';

  return (await File(filePath).writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)))
      .uri;
}
