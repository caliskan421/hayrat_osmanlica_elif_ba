import 'color_model.dart';

class KonuModel {
  final int id;
  final String title;

  /// Todo -> Svg almak mantıklı mı?
  final String rikaIcon;
  final String matbuIcon;
  final List<int> dersIdleri;
  final KonuColorModel color;

  KonuModel({
    required this.id,
    required this.title,
    required this.rikaIcon,
    required this.matbuIcon,
    required this.dersIdleri,
    required this.color,
  });

  factory KonuModel.fromJson(Map<String, dynamic> json) {
    return KonuModel(
      id: json["id"],
      title: json['konuTitle'],
      rikaIcon: json['rika'] ?? '',
      matbuIcon: json['matbu'] ?? '',
      dersIdleri: (json['dersler'] as List).map((ders) => ders['id'] as int).toList(),
      color: KonuColorModel.fromKonuModelJson(json['color']),
    );
  }
}
