import 'ornek_model.dart';

class IcerikModel {
  final String konu;
  final String icerikType;
  final bool hatGecisAcikMi;
  final List<Ornek> ornek;

  IcerikModel({
    required this.konu,
    required this.icerikType,
    required this.hatGecisAcikMi,
    required this.ornek,
  });

  factory IcerikModel.fromJson(Map<String, dynamic> json) {
    List<Ornek> orneklerList =
        (json['ornek'] as List).map((ornekJson) => Ornek.fromJson(ornekJson)).toList();
    return IcerikModel(
      konu: json['konu'],
      icerikType: json['icerikType'],
      hatGecisAcikMi: json['hatGecisAcikMi'],
      ornek: orneklerList,
    );
  }
}
