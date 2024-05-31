class AdaptiveDialogValidators {
  String? required(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Không thể để trống';
    }

    return null;
  }
}

final adaptiveDialogValidators = AdaptiveDialogValidators();
