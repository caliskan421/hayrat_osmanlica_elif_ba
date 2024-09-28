import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../model/konu_model.dart';

class KonularService {
  Future<String> fetchIconKonuTitle(BuildContext context, int index) async {
    String value = await DefaultAssetBundle.of(context).loadString(
      'assets/json_model/json_model.json',
    );

    var jsonObject = jsonDecode(value);
    List<KonuModel> list =
        (jsonObject as List).map((item) => KonuModel.fromJson(item)).toList();

    return list[index].konu.toString();
  }
}
