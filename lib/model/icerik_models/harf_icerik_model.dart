import '../icerik_model.dart';
import '../ornek_models/harf_ornek_model.dart';

class HarfIcerikModel extends IcerikModel {
  final List<HarfOrnekModel> ornek;

  HarfIcerikModel({
    required super.konu,
    required super.hatGecisAcikMi,
    required this.ornek,
  }) : super(
          icerikType: IcerikType.harf,
        );

  factory HarfIcerikModel.fromJson(Map<String, dynamic> json) {
    return HarfIcerikModel(
      konu: json['konu'],
      hatGecisAcikMi: json['hatGecisAcikMi'],
      ornek: (json['ornek'] as List).map((e) => HarfOrnekModel.fromJson(e)).toList(),
    );
  }
}
