import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  ColorScheme colorScheme() {
    return Theme.of(this).colorScheme;
  }
}
