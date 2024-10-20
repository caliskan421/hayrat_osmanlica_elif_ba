import 'dart:ui';

import 'base_color_model.dart';

class DersColorModel extends BaseColorModel {
  Color? get latColor => colors['latColor'];

  Color? get osmColor => colors['osmColor'];

  Color? get contColor => colors['contColor'];

  DersColorModel();

  factory DersColorModel.fromJson(Map<String, dynamic> json) {
    final model = DersColorModel();
    model.loadColors(json, {
      'latColor': 'lat',
      'osmColor': 'osm',
      'contColor': 'cont',
    });
    return model;
  }
}
