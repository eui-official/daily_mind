import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/adaptive_dialog_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DialogsExt on BuildContext {
  Future<OkCancelResult> onConfirmDeletePlaylistDialog() async {
    return showOkCancelAlertDialog(
      context: this,
      title: 'Xóa playlist'.tr(),
      message: 'Bạn có chắc chắn muốn xóa playlist này?'.tr(),
      okLabel: 'Xóa'.tr(),
      cancelLabel: 'Hủy'.tr(),
    );
  }

  Future<List<String>> onTextFieldDialog(
    String hintText, [
    String? initialText,
  ]) async {
    final results = await showTextInputDialog(
      context: this,
      textFields: [
        DialogTextField(
          hintText: hintText,
          initialText: initialText,
          validator: adaptiveDialogValidators.required,
        ),
      ],
    );

    return results ?? [];
  }
}
