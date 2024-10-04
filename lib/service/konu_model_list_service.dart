import 'dart:convert';
import '../model/konu_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class KonuModelListService {
  Future<List<KonuModel>> fetchKonularFromJson() async {
    String value = await rootBundle.loadString('assets/json_model/konu_list_model.json');

    var jsonObject = jsonDecode(value);
    List<KonuModel> konularList =
        (jsonObject as List).map((item) => KonuModel.fromJson(item)).toList();
    return konularList;
  }
}
