import 'ders_color_model.dart';

class Ornek {
  final String osm;
  final String lat;
  final bool hasDottedBorder;
  final DersColorModel colors; // DersColorModel olmalı

  Ornek({
    required this.osm,
    required this.lat,
    required this.hasDottedBorder,
    required this.colors,
  });

  factory Ornek.fromJson(Map<String, dynamic> json) {
    return Ornek(
      osm: json['osm'],
      lat: json['lat'],
      hasDottedBorder: json['hasDottedBorder'],
      colors: DersColorModel.fromDersModelJson(json['colors']),
    );
  }
}
