import 'package:shared_preferences/shared_preferences.dart';

class KonuStateService {
  Future<void> saveKonuId(int id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('konuId', id);
  }

  Future<int> getKonuId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('konuId') ?? 1;
  }
}
