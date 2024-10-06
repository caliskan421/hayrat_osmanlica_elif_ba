import 'ornek_model.dart';

class IcerikModel {
  final String? konu;
  final String? icerikType;
  final bool? hatGecisAcikMi;
  final List<OrnekModel>? ornek;

  IcerikModel({
    this.konu,
    this.icerikType,
    this.hatGecisAcikMi,
    this.ornek,
  });

  factory IcerikModel.fromJson(Map<String, dynamic> json) {
    return IcerikModel(
      // JSON'daki 'konu' null olabilir, bu yüzden null kontrolü yapıyoruz.
      konu: json['konu'] ?? '',
      icerikType: json['icerik_type'] ?? '',
      hatGecisAcikMi: json['hatGecisAcikMi'] ?? false,
      ornek: json['ornek'] != null
          ? (json['ornek'] as List)
              .map((ornekJson) => OrnekModel.fromJson(ornekJson))
              .toList()
          : [],
    );
  }
}
