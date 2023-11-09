import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:reactive_forms/reactive_forms.dart';

class BaseReactiveTextField extends StatelessWidget {
  final bool autofocus;
  final InputDecoration decoration;
  final String formControlName;
  final String title;
  final TextInputType? textInputType;

  const BaseReactiveTextField({
    super.key,
    required this.formControlName,
    required this.title,
    this.autofocus = false,
    this.decoration = const InputDecoration(),
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContentHeader(
      title: title,
      child: ReactiveTextField(
        autofocus: autofocus,
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
