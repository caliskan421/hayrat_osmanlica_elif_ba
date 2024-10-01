import 'package:shared_preferences/shared_preferences.dart';

class DersStateService {
  static const String visitedDersKey = "visitedDers";

  Future<void> saveDersAsVisited(int konuId, int dersId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? visitedDers = prefs.getStringList(visitedDersKey) ?? [];

    // 'konuId-dersId' formatında bir string kaydediyoruz
    String dersKey = "$konuId-$dersId";

    if (!visitedDers.contains(dersKey)) {
      visitedDers.add(dersKey);
      await prefs.setStringList(visitedDersKey, visitedDers);
    }
  }

  Future<List<String>> getVisitedDers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? visitedDers = prefs.getStringList(visitedDersKey) ?? [];
    return visitedDers;
  }

  bool isDersVisited(List<String> visitedDers, int konuId, int dersId) {
    String dersKey = "$konuId-$dersId";
    return visitedDers.contains(dersKey);
  }
}
