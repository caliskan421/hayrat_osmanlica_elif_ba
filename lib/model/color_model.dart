import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class KonuColorModel {
  final Color color;

  KonuColorModel({required this.color});

  factory KonuColorModel.fromKonuModelJson(String colorName) {
    final color = AppColors.colorMap[colorName] ?? AppColors.primary;
    return KonuColorModel(
      color: color,
    );
  }
}
