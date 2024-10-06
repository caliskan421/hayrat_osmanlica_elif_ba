import 'ders_color_model.dart';

class OrnekModel {
  final String osm;
  final String lat;
  final bool hasDottedBorder;
  final DersColorModel colors; // DersColorModel olmalı

  OrnekModel({
    required this.osm,
    required this.lat,
    required this.hasDottedBorder,
    required this.colors,
  });

  factory OrnekModel.fromJson(Map<String, dynamic> json) {
    return OrnekModel(
      osm: json['osm'],
      lat: json['lat'],
      hasDottedBorder: json['hasDottedBorder'],
      colors: DersColorModel.fromDersModelJson(json['colors']),
    );
  }
}
