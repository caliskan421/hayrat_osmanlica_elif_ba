import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../model/ders_model.dart';

class DersModelListService {
  Future<List<DersModel>> fetchDerslerFromJson() async {
    String value = await rootBundle.loadString('assets/json_model/ders_list_model.json');

    var jsonObject = jsonDecode(value);
    List<DersModel> derslerList =
        (jsonObject as List).map((item) => DersModel.fromJson(item)).toList();
    log(derslerList.length.toString());
    return derslerList;
  }

  Future<Map<String, dynamic>> fetchDersById(int dersId) async {
    String value = await rootBundle.loadString('assets/json_model/ders_list_model.json');
    List<dynamic> dersList = jsonDecode(value);

    // Ders ID'ye göre JSON'dan doğru dersi çektiğinden emin ol
    final ders = dersList.firstWhere((ders) => ders['id'] == dersId, orElse: () => null);

    if (ders == null) {
      log('Ders ID $dersId bulunamadı');
      return {}; // Boş dön
    }

    return ders;
  }
}
