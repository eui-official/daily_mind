import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:reactive_forms/reactive_forms.dart';

class BaseReactiveTextField extends StatelessWidget {
  final String title;
  final String formControlName;
  final TextInputType? textInputType;
  final InputDecoration decoration;

  const BaseReactiveTextField({
    super.key,
    required this.title,
    required this.formControlName,
    this.textInputType,
    this.decoration = const InputDecoration(),
  });

  @override
  Widget build(BuildContext context) {
    return BaseContentHeader(
      title: title,
      child: ReactiveTextField(
        formControlName: formControlName,
        keyboardType: textInputType,
        decoration: decoration,
        validationMessages: {
          ValidationMessage.required: (control) => 'required'.tr(),
        },
        scrollPadding: context.mediaQueryViewInsets,
      ),
    );
  }
}
