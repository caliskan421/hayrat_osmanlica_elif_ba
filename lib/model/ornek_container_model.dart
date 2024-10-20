import 'harf_renk.dart';

class OrnekContainer {
  final List<List<HarfRenk>> harfList;

  OrnekContainer({required this.harfList});

  factory OrnekContainer.fromJson(Map<String, dynamic> json) {
    var harfListJson = json['harfList'] as List<dynamic>? ?? [];

    List<List<HarfRenk>> harfList = harfListJson.map((list) {
      var innerList = (list as List<dynamic>? ?? []).map((e) {
        return HarfRenk.fromJson(e as Map<String, dynamic>);
      }).toList();
      return innerList;
    }).toList();

    return OrnekContainer(harfList: harfList);
  }
}
