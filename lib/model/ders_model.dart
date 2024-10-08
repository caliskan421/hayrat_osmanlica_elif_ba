import 'icerik_model.dart';

class DersModel {
  final int id;
  final String title;
  final String link;
  final List<IcerikModel>? icerikler;

  DersModel({
    required this.id,
    required this.title,
    required this.link,
    required this.icerikler,
  });

  factory DersModel.fromJson(Map<String, dynamic> json) {
    return DersModel(
      id: json['id'],
      title: json['title'],
      link: json['link'],
      icerikler: json['icerik'] == null
          ? null
          : (json['icerik'] as List)
              .map((icerikJson) => IcerikModel.fromJson(icerikJson))
              .toList(),
    );
  }



  @override
  String toString() {
    return "ID: $id";
  }
}
