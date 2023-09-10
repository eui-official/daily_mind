import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:daily_mind/features/introduction/application/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends HookWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final firstTime = useMemoized(() => db.getFirstTime("introduction"), []);

    return EmptyWidgetBuilder(
      data: firstTime,
      builder: (safeFirstTime) {
        return const Dashboard();
      },
      empty: IntroductionScreen(
        pages: [
          createPageViewModel(
            context,
            title: 'Theo sở thích của bạn',
            body: 'Tạo một bản nhạc từ các âm thanh thiên nhiên',
            image: 'assets/images/birds.png',
          ),
          createPageViewModel(
            context,
            title: 'Thư giãn hơn',
            body:
                'Âm thanh của thiên nhiên giúp thư giãn và giảm đi sự căng thẳng',
            image: 'assets/images/relax.png',
          ),
        ],
        onDone: () {
          db.addFirstTime("introduction");
          context.pushReplacement("/dashboard");
        },
        next: const Text('Tiếp theo'),
        done: const Text('Trang chủ'),
        controlsPadding: const EdgeInsets.only(bottom: kToolbarHeight),
      ),
    );
  }
}
