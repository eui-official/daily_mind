import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<Uri> onGetSoundImageFromAsset(String image) async {
  final byteData = await rootBundle.load(image);
  final buffer = byteData.buffer;
  Directory tempDir = await getApplicationDocumentsDirectory();

  String tempPath = tempDir.path;
  var filePath = '$tempPath/daily-mind-art.png';

  return (await File(filePath).writeAsBytes(
          buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)))
      .uri;
}
