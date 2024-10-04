import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class DersColorModel {
  final Color? latColor;
  final Color? osmColor;
  final Color? contColor;

  DersColorModel({this.latColor, this.osmColor, this.contColor});

  factory DersColorModel.fromDersModelJson(Map<String, dynamic> json) {
    return DersColorModel(
      latColor: AppColors.colorMap[json['lat']] ?? AppColors.primary,
      osmColor: AppColors.colorMap[json['osm']] ?? AppColors.primary,
      contColor: AppColors.colorMap[json['cont']] ?? AppColors.primary,
    );
  }
}
