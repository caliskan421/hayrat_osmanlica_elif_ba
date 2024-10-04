import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class KonuColorModel {
  final Color color;

  KonuColorModel({required this.color});

  factory KonuColorModel.fromKonuModelJson(String colorName) {
    // String gelen colorName'i Color'a çevir
    final color = AppColors.colorMap[colorName] ?? AppColors.primary;
    return KonuColorModel(
      color: color,
    );
  }
}
