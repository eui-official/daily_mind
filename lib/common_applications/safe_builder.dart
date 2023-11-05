import 'package:flutter/material.dart';

void onSafeValueBuilder<T>(
  T? data,
  ValueChanged<T> cb, [
  VoidCallback? orElse,
]) {
  if (data != null) {
    return cb(data);
  } else {
    return orElse?.call();
  }
}
