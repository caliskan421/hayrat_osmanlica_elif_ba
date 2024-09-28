import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/model/konu_model.dart';

class DerslerService {
  Future<String> fetchDersTitle(
      BuildContext context, int konuIndex, int dersIndex) async {
    String value = await DefaultAssetBundle.of(context).loadString(
      'assets/json_model/json_model.json',
    );
    var jsonObject = jsonDecode(value);
    List<KonuModel> list =
        (jsonObject as List).map((item) => KonuModel.fromJson(item)).toList();

    return list[konuIndex].dersler[dersIndex].dersAdi;
  }
}
