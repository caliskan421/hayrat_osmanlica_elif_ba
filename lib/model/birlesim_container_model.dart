import 'harf_renk.dart';

class BirlesimContainer {
  final List<HarfRenk> harfList;

  BirlesimContainer({required this.harfList});

  factory BirlesimContainer.fromJson(Map<String, dynamic> json) {
    var harfListJson = json['harfList'] as List<dynamic>? ?? [];
    List<HarfRenk> harfList = harfListJson.map((e) {
      return HarfRenk.fromJson(e as Map<String, dynamic>);
    }).toList();

    return BirlesimContainer(harfList: harfList);
  }
}
