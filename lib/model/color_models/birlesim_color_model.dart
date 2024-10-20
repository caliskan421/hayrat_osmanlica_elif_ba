import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/core/extensions/theme_extension.dart';
import 'base_color_model.dart';

class BirlesimColorModel extends BaseColorModel {
  Color? get harfColor => colors['harfColor'];

  Color? get okutucuHarfColor => colors['okutucuHarfColor'];

  Color? get ornekContainerColor => colors['ornekContainerColor'];

  Color? get okutucuContainerColor => colors['okutucuContainerColor'];

  BirlesimColorModel();

  factory BirlesimColorModel.fromJson(Map<String, dynamic> json) {
    final model = BirlesimColorModel();
    model.loadColors(json, {
      'harfColor': 'harfColor',
      'okutucuHarfColor': 'okutucuHarfColor',
      'ornekContainerColor': 'ornekContainerColor',
      'okutucuContainerColor': 'okutucuContainerColor',
    });
    return model;
  }

  Color? getColorByName(BuildContext context, String colorName) {
    switch (colorName) {
      case 'harfColor':
        return harfColor;
      case 'okutucuHarfColor':
        return okutucuHarfColor;
      case 'ornekContainerColor':
        return ornekContainerColor;
      case 'okutucuContainerColor':
        return okutucuContainerColor;
      default:
        return context.colorScheme().onSurface;
    }
  }
}
