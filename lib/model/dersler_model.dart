class DersModel {
  final String dersAdi;
  final String link;

  DersModel({required this.dersAdi, required this.link});

  factory DersModel.fromJson(Map<String, dynamic> json) {
    return DersModel(
      dersAdi: json['dersAdi'],
      link: json['link'] ?? '',
    );
  }
}
