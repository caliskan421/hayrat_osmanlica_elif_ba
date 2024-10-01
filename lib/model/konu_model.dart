import 'ders_model.dart';
import 'color_model.dart';

class KonuModel {
  final int id;
  final String title;
  final String rikaIcon;
  final String matbuIcon;
  final List<DersModel> dersler;
  final ColorModel renkler;

  KonuModel({
    required this.id,
    required this.title,
    required this.rikaIcon,
    required this.matbuIcon,
    required this.dersler,
    required this.renkler,
  });

  factory KonuModel.fromJson(Map<String, dynamic> json) {
    var derslerList = (json['dersler'] as List)
        .map((dersJson) => DersModel.fromJson(dersJson))
        .toList();

    return KonuModel(
      id: json["id"],
      title: json['konu_title'],
      rikaIcon: json['rika'] ?? '',
      matbuIcon: json['matbu'] ?? '',
      dersler: derslerList,
      renkler: ColorModel.fromJson(json['renkler']),
    );
  }
}
