import 'dart:ui';

import '../../theme/light_theme.dart';

class BaseColorModel {
  final Map<String, Color?> colors = {};

  BaseColorModel();

  void loadColors(Map<String, dynamic> json, Map<String, String> keyMap) {
    keyMap.forEach((propertyKey, jsonKey) {
      colors[propertyKey] = AppColors.colorMap[json[jsonKey]] ?? AppColors.primary;
    });
  }
}
