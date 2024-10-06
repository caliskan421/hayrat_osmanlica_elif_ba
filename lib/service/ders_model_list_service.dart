import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// ders_list_model.json daki her bir liste elemanini [Map] olarak donduren Service
/// [Map] dondurme nedenimiz:
///   Ders bilgilerini [ID] bazlı bir sorguyla çekiyorsun (örneğin [fetchDersById] metodu ile {belirli bir dersId}’ye sahip dersi çekiyorsun).
class DersModelListService {
  Future<Map<String, dynamic>> fetchDersById(int dersId) async {
    String value = await rootBundle.loadString('assets/json_model/ders_list_model.json');
    List<dynamic> dersList = jsonDecode(value);

    // Ders ID'ye göre JSON'dan doğru dersi çektiğinden emin ol
    final ders = dersList.firstWhere((ders) => ders['id'] == dersId, orElse: () => null);

    if (ders == null) {
      return {};
    }

    return ders;
  }
}
