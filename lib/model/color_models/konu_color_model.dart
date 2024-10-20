import 'dart:ui';

import 'base_color_model.dart';

class KonuColorModel extends BaseColorModel {
  Color? get primaryColor => colors['primaryColor'];
  Color? get secondaryColor => colors['secondaryColor'];

  KonuColorModel();

  factory KonuColorModel.fromJson(Map<String, dynamic> json) {
    final model = KonuColorModel();
    model.loadColors(json, {
      'primaryColor': 'primary',
      'secondaryColor': 'secondary',
    });
    return model;
  }
}
