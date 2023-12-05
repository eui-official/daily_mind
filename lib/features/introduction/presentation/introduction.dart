import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
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
    final isFirstTime = useMemoized(
      () => db.onIsFirstTime("introduction"),
      [],
    );

    final child = useMemoized(() {
      if (isFirstTime) {
        Scaffold(
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
              db.onAddFirstTime("introduction");
              context.pushReplacement("/dashboard");
            },
            next: Text('next'.tr()),
            done: Text('dashboard'.tr()),
            controlsPadding: const EdgeInsets.only(bottom: kToolbarHeight),
          ),
        );
      }

      return const Dashboard();
    }, [isFirstTime]);

    useEffect(() {
      if (isFirstTime) {
        player.onSetSource('water');
        player.setVolume(0.2);
        player.play();
      }

      return () {
        player.onDispose();
      };
    }, [isFirstTime]);

    return BaseAnimatedSwitcher(child: child);
  }
}
