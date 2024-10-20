import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

/// ders_list_model.json daki her bir liste elemanini [Map] olarak donduren Service
/// [Map] dondurme nedenimiz:
///   Ders bilgilerini [ID] bazlı bir sorguyla çekiyoruz
///   (örneğin [fetchDersById] metodu ile {belirli bir dersId}’ye sahip dersi çekiyoruz).
class DersService {
  Future<Map<String, dynamic>> fetchDersById(int dersId) async {
    try {
      String value =
          await rootBundle.loadString('assets/json_model/ders_list_model.json');
      List<dynamic> dersList = jsonDecode(value);

      final ders = dersList.firstWhere(
        (ders) => ders['id'] == dersId,
        orElse: () => null,
      );

      if (ders == null) {
        throw Exception('Ders bulunamadı: $dersId');
      }

      return ders as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  Future<void> saveDersId(int id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('dersId', id);
  }

  Future<int?> getDersId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('dersId');
  }

  Future<void> saveIsRika(bool isRika) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isRika', isRika);
  }

  Future<bool> getIsRika() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isRika') ?? false;
  }
}
