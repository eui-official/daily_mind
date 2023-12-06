import 'package:daily_mind/constants/constants.dart';

class AdaptiveDialogValidators {
  String? required(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Không thể để trống';
    }

    return kNull;
  }
}

final adaptiveDialogValidators = AdaptiveDialogValidators();
