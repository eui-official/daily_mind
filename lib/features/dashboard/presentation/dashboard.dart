import 'package:daily_mind/features/create_mix/presentation/create_mix.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Daily Mind',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: const CreateMix(),
    );
  }
}
