import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/features/offline_list_audio_minimal/presentation/offline_list_audio_minimal.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class FocusModeSettings extends StatelessWidget {
  const FocusModeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(spacing(2)),
        child: BaseContentHeader(
          title: 'Cấu hình nhiệm vụ',
          child: Flexible(
            child: Column(
              children: [
                Flexible(
                  child: OfflineListAudioMinimal(
                    onSelected: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
