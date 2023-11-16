import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/features/focus_mode/presentation/focus_mode.dart';
import 'package:daily_mind/features/focus_mode_task_new_flow/presentation/focus_mode_task_new_flow.dart';
import 'package:daily_mind/features/introduction/presentation/introduction.dart';
import 'package:daily_mind/features/mix/presentation/mix.dart';
import 'package:daily_mind/features/online_list/presentation/online_list.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Introduction(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/focus-mode',
      builder: (context, state) => const FocusMode(),
    ),
    GoRoute(
      path: '/mix',
      builder: (context, state) => const Mix(),
    ),
    GoRoute(
      path: '/online-list',
      builder: (context, state) => const OnlineList(),
    ),
    GoRoute(
      path: '/focus-mode/task/new',
      builder: (context, state) => const FocusModeTaskNewFlow(),
    )
  ],
);
