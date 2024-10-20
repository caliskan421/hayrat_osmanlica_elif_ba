import 'dart:ui';

import 'base_color_model.dart';

class SayiColorModel extends BaseColorModel {
  Color? get latColor => colors['latColor'];

  Color? get osmColor => colors['osmColor'];

  Color? get contColor => colors['contColor'];

  SayiColorModel();

  factory SayiColorModel.fromJson(Map<String, dynamic> json) {
    final model = SayiColorModel();
    model.loadColors(json, {
      'latColor': 'lat',
      'osmColor': 'osm',
      'contColor': 'cont',
    });
    return model;
  }
}
