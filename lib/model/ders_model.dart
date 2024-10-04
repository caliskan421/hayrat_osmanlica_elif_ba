import 'ders_color_model.dart';
import 'icerik_model.dart';

class DersModel {
  final int id;
  final String title;
  final String link;
  final List<IcerikModel> icerikler;
  final DersColorModel colors;

  DersModel({
    required this.id,
    required this.title,
    required this.link,
    required this.icerikler,
    required this.colors,
  });

  factory DersModel.fromJson(Map<String, dynamic> json) {
    return DersModel(
      id: json['id'],
      title: json['title'],
      link: json['link'],
      icerikler: (json['icerik'] as List)
          .map((icerikJson) => IcerikModel.fromJson(icerikJson))
          .toList(),
      colors:
          DersColorModel.fromDersModelJson(json['colors']), // DersColorModel kullanılıyor
    );
  }
}
