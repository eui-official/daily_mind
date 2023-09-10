import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/introduction/presentation/introduction.dart';
import 'package:daily_mind/features/mix_editor/presentation/mix_editor.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Introduction(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/new-mix',
      builder: (context, state) => const NewMix(),
    ),
    GoRoute(
      path: '/mix-editor',
      builder: (context, state) => const MixEditor(),
    ),
    GoRoute(
      path: '/play-mix',
      builder: (context, state) => PlayMix(
        playlistId: state.pathParameters['id'] as int,
      ),
    ),
  ],
);
