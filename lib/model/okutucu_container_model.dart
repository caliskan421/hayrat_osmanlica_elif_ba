class OkutucuContainer {
  final List<String> harfList;

  OkutucuContainer({required this.harfList});

  factory OkutucuContainer.fromJson(Map<String, dynamic> json) {
    var harfListJson = json['harfList'] as List<dynamic>? ?? [];

    List<String> harfList = harfListJson.map((e) => e.toString()).toList();

    return OkutucuContainer(harfList: harfList);
  }
}
