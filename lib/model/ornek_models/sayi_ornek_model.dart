import '../color_models/sayi_color_model.dart';

class SayiOrnekModel {
  final String osm;
  final String lat;
  final bool hasDottedBorder;
  final SayiColorModel colors;

  SayiOrnekModel({
    required this.osm,
    required this.lat,
    required this.hasDottedBorder,
    required this.colors,
  });

  factory SayiOrnekModel.fromJson(Map<String, dynamic> json) {
    return SayiOrnekModel(
      osm: json['osm'] ?? '',
      lat: json['lat'] ?? '',
      hasDottedBorder: json['hasDottedBorder'] ?? false,
      colors: SayiColorModel.fromJson(json['colors'] ?? {}),
    );
  }
}
