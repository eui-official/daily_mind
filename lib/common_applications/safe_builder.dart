import 'package:flutter/material.dart';

void safeValueBuilder<T>(
  T? data,
  ValueChanged<T> cb, [
  VoidCallback? orElse,
]) {
  if (data != null) {
    return cb(data);
  } else {
    orElse?.call();
  }
}
