import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/introduction/presentation/introduction.dart';
import 'package:daily_mind/features/mix/presentation/mix.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
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
      path: '/mix',
      builder: (context, state) => const Mix(),
    ),
    GoRoute(
      path: '/online-list',
      builder: (context, state) => const OnlineList(),
    ),
  ],
);
