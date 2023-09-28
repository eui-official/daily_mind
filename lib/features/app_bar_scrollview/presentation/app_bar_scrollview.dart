import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:daily_mind/features/app_logo/presentation/app_logo.dart';
import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarScrollview extends HookConsumerWidget {
  final String title;
  final List<Widget> children;

  const AppBarScrollview({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const AppLogo(),
          title: Text(title),
          flexibleSpace: Background(image: appState.backgroundImage),
          expandedHeight: kToolbarHeight * 2,
        ),
        SliverList(delegate: SliverChildListDelegate(children))
      ],
    );
  }
}
