import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/konu_model.dart';
import 'package:flutter/services.dart' show rootBundle;

/// konu_list_model.json daki her bir liste elemanini [KonuModel] olarak donduren Service
class KonuService {
  Future<List<KonuModel>> fetchKonularFromJson() async {
    try {
      String value =
          await rootBundle.loadString('assets/json_model/konu_list_model.json');
      var jsonObject = jsonDecode(value);
      List<KonuModel> konularList =
          (jsonObject as List).map((item) => KonuModel.fromJson(item)).toList();
      return konularList;
    } catch (e) {
      return [];
    }
  }

  Future<void> saveKonuId(int id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('konuId', id);
  }

  Future<int> getKonuId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('konuId') ?? 1;
  }
}
