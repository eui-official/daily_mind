import 'package:flutter/material.dart';

BottomNavigationBarItem onGetBottomNavigationBarItem({
  required Icon icon,
  required String label,
}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
    backgroundColor: Colors.transparent,
  );
}
