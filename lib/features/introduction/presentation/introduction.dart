import 'package:daily_mind/features/introduction/application/introduction.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
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
              'Âm thanh pcủa thiên nhiên giúp thư giãn và giảm đi sự căng thẳng',
          image: 'assets/images/relax.png',
        ),
      ],
      showNextButton: false,
      done: const Text("Tới trang chủ"),
      onDone: () {
        context.pushReplacement("/dashboard");
      },
    );
  }
}
