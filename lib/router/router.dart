import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
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
  ],
);
