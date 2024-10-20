import 'package:hayrat_osmanlica_elif_ba/model/icerik_models/sayi_icerik_model.dart';

import 'icerik_models/birlesim_icerik_model.dart';
import 'icerik_models/harf_icerik_model.dart';

enum IcerikType { harf, sayi, birlesim }

abstract class IcerikModel {
  final String? konu;
  final IcerikType icerikType;
  final bool? hatGecisAcikMi;

  IcerikModel({
    required this.konu,
    required this.icerikType,
    this.hatGecisAcikMi,
  });

  factory IcerikModel.fromJson(Map<String, dynamic> json) {
    final String typeString = json['icerikType'];

    /// [IcerikType.values]: IcerikType enum’ının tüm değerlerini içeren bir liste döndürür.
    /// Bu liste: [IcerikType.harf, IcerikType.sayi, IcerikType.birlesim].
    /// [firstWhere] Metodu: Liste üzerinde gezinerek, verilen koşulu sağlayan
    ///   ilk elemanı bulur. Eğer hiçbir eleman koşulu sağlamazsa;
    ///   [orElse] parametresindeki fonksiyonu çağırır.
    /// [e.toString()]: Enum değerini string’e çevirir.
    ///   Örneğin, IcerikType.harf için 'IcerikType.harf' döner.
    /// [.split('.')]: String’i '.' karakterine göre böler ve bir liste döndürür.
    ///   Örneğin, 'IcerikType.harf'.split('.') sonucu ['IcerikType', 'harf'] olur.
    /// [.last]: Listenin son elemanını alır.
    ///   Bu da enum değerinin adı olur, yani 'harf'.
    final IcerikType type = IcerikType.values.firstWhere(
      (e) => e.toString().split('.').last == typeString,
      orElse: () => throw Exception('Bilinmeyen icerikType: $typeString'),
    );

    switch (type) {
      case IcerikType.harf:
        return HarfIcerikModel.fromJson(json);
      case IcerikType.sayi:
        return SayiIcerikModel.fromJson(json);
      case IcerikType.birlesim:
        return BirlesimIcerikModel.fromJson(json);
      default:
        throw Exception('İşlenemeyen icerikType: $type');
    }
  }
}
