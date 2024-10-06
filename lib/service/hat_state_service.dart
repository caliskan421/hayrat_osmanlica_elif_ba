import 'package:shared_preferences/shared_preferences.dart';

/// Konu ikonlarini secilen Hat'ta gore local'e kaydeden Service
class HatStateService {
  Future<void> saveIsRika(bool isRika) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isRika', isRika);
  }

  Future<bool> getIsRika() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isRika') ?? false;
  }
}
