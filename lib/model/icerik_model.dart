import 'ornek_models/harf_ornek_model.dart';
import 'ornek_models/sayi_ornek_model.dart';

class IcerikModel {
  final String? konu;
  final String? icerikType;
  final bool? hatGecisAcikMi;
  final List<dynamic>? ornek;

  IcerikModel({
    this.konu,
    this.icerikType,
    this.hatGecisAcikMi,
    this.ornek,
  });

  factory IcerikModel.fromJson(Map<String, dynamic> json) {
    List<HarfOrnekModel> ornekList;
    if (json['icerikType'] == 'harf') {
      ornekList = (json['ornek'] as List).map((e) => HarfOrnekModel.fromJson(e)).toList();
    } else if (json['icerikType'] == 'sayi') {
      ornekList = [];
    } else {
      ornekList = [];
    }
    return IcerikModel(
      konu: json['konu'],
      icerikType: json['icerikType'],
      ornek: ornekList,
    );
  }

  get harfMi => icerikType == "harf";
  get sayiMi => icerikType == "sayi";
}
