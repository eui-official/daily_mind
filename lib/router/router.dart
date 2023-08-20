import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/mix_editor/presentation/mix_editor.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
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
  ],
);
