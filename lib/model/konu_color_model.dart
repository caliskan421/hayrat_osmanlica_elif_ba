import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class KonuColorModel {
  final Color? primaryColor;
  final Color? secondaryColor;

  KonuColorModel({this.primaryColor, this.secondaryColor});

  factory KonuColorModel.fromKonuModelJson(Map<String, dynamic> json) {
    return KonuColorModel(
      primaryColor: AppColors.colorMap[json['primary']] ?? AppColors.primary,
      secondaryColor: AppColors.colorMap[json['secondary']] ?? AppColors.primary,
    );
  }
}
