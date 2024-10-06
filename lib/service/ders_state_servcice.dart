import 'package:shared_preferences/shared_preferences.dart';

///Son cikilan dersin secili oldugunu locale kaydeden Service [ID]
class DersStateService {
  Future<void> saveDersId(int id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('dersId', id);
  }

  Future<int?> getDersId() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('dersId');
  }
}
