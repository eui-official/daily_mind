import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseAnimatedOpacity extends HookWidget {
  final Widget child;
  final ValueKey valueKey;

  const BaseAnimatedOpacity({
    super.key,
    required this.valueKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = useState(false);

    useEffect(() {
      isVisible.value = false;

      Future.delayed(
        kRadialReactionDuration,
        () {
          isVisible.value = true;
        },
      );

      return () {};
    }, [valueKey]);

    return BaseAnimatedSwitcher(
      child: isVisible.value ? child : emptyWidget,
    );
  }
}
