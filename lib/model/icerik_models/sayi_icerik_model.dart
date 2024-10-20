import '../icerik_model.dart';
import '../ornek_models/sayi_ornek_model.dart';

class SayiIcerikModel extends IcerikModel {
  final List<List<SayiOrnekModel>> ornek;

  SayiIcerikModel({
    required String? konu,
    required bool? hatGecisAcikMi,
    required this.ornek,
  }) : super(
          konu: konu,
          icerikType: IcerikType.sayi,
          hatGecisAcikMi: hatGecisAcikMi,
        );

  factory SayiIcerikModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? ornekJsonList = json['ornek'];

    if (ornekJsonList == null) {
      // ornek alanı yok veya null, boş bir liste atıyoruz veya hata fırlatıyoruz
      return SayiIcerikModel(
        konu: json['konu'],
        hatGecisAcikMi: json['hatGecisAcikMi'],
        ornek: [],
      );
    }

    return SayiIcerikModel(
      konu: json['konu'],
      hatGecisAcikMi: json['hatGecisAcikMi'],
      ornek: ornekJsonList
          .map((list) => (list as List).map((e) => SayiOrnekModel.fromJson(e)).toList())
          .toList(),
    );
  }
}
