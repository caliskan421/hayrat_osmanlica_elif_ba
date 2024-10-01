import 'dart:ui';
import 'package:hayrat_osmanlica_elif_ba/theme/light_theme.dart';

class ColorModel {
  final Color primaryColor;
  final Color secondaryColor;

  ColorModel({required this.primaryColor, required this.secondaryColor});

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    final primaryColorName = json['primary_color'] as String;
    final secondaryColorName = json['secondary_color'] as String;

    final primaryColor = AppColors.colorMap[primaryColorName] ?? AppColors.primary;
    final secondaryColor = AppColors.colorMap[secondaryColorName] ?? AppColors.primary;

    return ColorModel(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );
  }
}
