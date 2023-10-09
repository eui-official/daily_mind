import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useEffectDelayed(VoidCallback cb, [List<Object?>? keys]) {
  return useEffect(() {
    Future(() {
      cb();
    });

    return () {};
  }, keys);
}
