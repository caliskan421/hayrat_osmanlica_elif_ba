import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

class DersModelListService {
  Future<Map<String, dynamic>> fetchDersById(int dersId) async {
    String value = await rootBundle.loadString('assets/json_model/ders_list_model.json');
    List<dynamic> dersList = jsonDecode(value);

    // Ders ID'ye göre JSON'dan doğru dersi çektiğinden emin ol
    final ders = dersList.firstWhere((ders) => ders['id'] == dersId, orElse: () => null);

    if (ders == null) {
      log('Ders ID $dersId bulunamadı');
      return {};
    }

    return ders;
  }
}
