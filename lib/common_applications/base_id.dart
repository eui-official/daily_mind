import 'package:uuid/uuid.dart';

class BaseId {
  var uuid = const Uuid();

  String get id => uuid.v4();
}

final baseId = BaseId();
