import '../icerik_model.dart';
import '../ornek_models/birlesim_ornek_model.dart';

class BirlesimIcerikModel extends IcerikModel {
  final List<BirlesimOrnekModel> ornek;

  BirlesimIcerikModel({
    required super.konu,
    required super.hatGecisAcikMi,
    required this.ornek,
  }) : super(
          icerikType: IcerikType.birlesim,
        );

  factory BirlesimIcerikModel.fromJson(Map<String, dynamic> json) {
    return BirlesimIcerikModel(
      konu: json['konu'],
      hatGecisAcikMi: json['hatGecisAcikMi'],
      ornek: (json['ornek'] as List).map((e) => BirlesimOrnekModel.fromJson(e)).toList(),
    );
  }
}
