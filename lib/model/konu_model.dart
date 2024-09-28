import 'dersler_model.dart';

class KonuModel {
  final String konu;
  final Map<String, String> icon;
  final List<DersModel> dersler;
  final Map<String, String> renkler;

  KonuModel(
      {required this.konu,
      required this.icon,
      required this.dersler,
      required this.renkler});

  factory KonuModel.fromJson(Map<String, dynamic> json) {
    var derslerList = (json['dersler'] as List)
        .map((dersJson) => DersModel.fromJson(dersJson))
        .toList();

    return KonuModel(
      konu: json['konu'],
      icon: Map<String, String>.from(json['icon']),
      dersler: derslerList,
      renkler: Map<String, String>.from(json['renkler']),
    );
  }
}
