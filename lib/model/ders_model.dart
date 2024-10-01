class DersModel {
  final int id;
  final String dersAdi;
  final String link;
  bool dersTiklanildiMi = false;

  DersModel({
    required this.id,
    required this.dersAdi,
    required this.link,
  });

  factory DersModel.fromJson(Map<String, dynamic> json) {
    return DersModel(
      id: json['id'],
      dersAdi: json['dersAdi'],
      link: json['link'] ?? '',
    );
  }
}
