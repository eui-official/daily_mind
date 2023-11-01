import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:daily_mind/features/introduction/application/introduction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends HookWidget {
  final player = GaplessAudioPlayer();

  Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    final firstTime = useMemoized(() => db.onGetFirstTime("introduction"), []);

    useEffect(() {
      safeValueBuilder(
        firstTime,
        (safeFirstTime) {},
        () async {
          await player.onSetSource('water');
          await player.setVolume(0.2);
          player.play();
        },
      );

      return () {
        player.onDispose();
      };
    }, []);

    return EmptyWidgetBuilder(
      data: firstTime,
      builder: (safeFirstTime) {
        return const Dashboard();
      },
      empty: Scaffold(
        body: IntroductionScreen(
          pages: [
            createPageViewModel(
              context,
              title: 'byYourFavorites'.tr(),
              body: 'createANewMixFromNaturalSounds'.tr(),
              image: 'assets/images/birds.png',
            ),
            createPageViewModel(
              context,
              title: 'moreRelaxing'.tr(),
              body: 'relaxMoreWithStories'.tr(),
              image: 'assets/images/relax.png',
            ),
          ],
          onDone: () {
            db.addFirstTime("introduction");
            context.pushReplacement("/dashboard");
          },
          next: Text('next'.tr()),
          done: Text('dashboard'.tr()),
          controlsPadding: const EdgeInsets.only(bottom: kToolbarHeight),
        ),
      ),
    );
  }
}
