import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/introduction/presentation/introduction.dart';
import 'package:daily_mind/features/offline_mix_editor/presentation/offline_mix_editor.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player.dart';
import 'package:daily_mind/features/stories/presentation/stories.dart';
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
      path: '/stories',
      builder: (context, state) => const Stories(),
    ),
    GoRoute(
      path: '/offline-mix-editor',
      builder: (context, state) => const OfflineMixEditor(),
    ),
    GoRoute(
      path: '/offline-player',
      builder: (context, state) => OfflinePlayer(
        playlistId: state.pathParameters['id'] as int,
      ),
    ),
  ],
);
