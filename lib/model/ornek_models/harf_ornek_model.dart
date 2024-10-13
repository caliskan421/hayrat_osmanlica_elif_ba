import '../ders_color_model.dart';

class HarfOrnekModel {
  final String osm;
  final String lat;
  final bool hasDottedBorder;
  final DersColorModel colors; // DersColorModel olmalı

  HarfOrnekModel({
    required this.osm,
    required this.lat,
    required this.hasDottedBorder,
    required this.colors,
  });

  factory HarfOrnekModel.fromJson(Map<String, dynamic> json) {
    return HarfOrnekModel(
      osm: json['osm'] ?? '',
      lat: json['lat'] ?? '',
      hasDottedBorder: json['hasDottedBorder'] ?? false,
      colors: json['colors'] != null
          ? DersColorModel.fromDersModelJson(json['colors'])
          : DersColorModel(),
    );
  }
}
