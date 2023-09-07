import 'package:flutter/material.dart';

void safeValueBuilder<T>(T? data, ValueChanged<T> cb) {
  if (data != null) {
    return cb(data);
  }
}
