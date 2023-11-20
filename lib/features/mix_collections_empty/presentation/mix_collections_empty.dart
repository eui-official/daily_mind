import 'package:daily_mind/common_widgets/base_empty_list_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MixCollectionsEmpty extends StatelessWidget {
  final VoidCallback onPressed;

  const MixCollectionsEmpty({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEmptyListBox(
      imageUrl: 'assets/images/background/5.jpg',
      title: "Bạn chưa có bộ sưu tập".tr(),
      action: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Tạo mới'),
      ),
    );
  }
}
