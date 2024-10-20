import '../birlesim_container_model.dart';
import '../color_models/birlesim_color_model.dart';
import '../okutucu_container_model.dart';
import '../ornek_container_model.dart';

class BirlesimOrnekModel {
  final BirlesimColorModel colors;
  final OkutucuContainer okutucuContainer;
  final OrnekContainer ornekContainer;
  final BirlesimContainer? birlesimContainer; // Yeni eklenen alan

  BirlesimOrnekModel({
    required this.colors,
    required this.okutucuContainer,
    required this.ornekContainer,
    this.birlesimContainer, // Optional olarak tanımladık
  });

  factory BirlesimOrnekModel.fromJson(Map<String, dynamic> json) {
    try {
      return BirlesimOrnekModel(
        colors: BirlesimColorModel.fromJson(json['colors'] ?? {}),
        okutucuContainer: OkutucuContainer.fromJson(json['okutucuContainer'] ?? {}),
        ornekContainer: OrnekContainer.fromJson(json['ornekContainer'] ?? {}),
        birlesimContainer: json['birlesimContainer'] != null
            ? BirlesimContainer.fromJson(json['birlesimContainer'])
            : null,
      );
    } catch (e) {
      return BirlesimOrnekModel(
        colors: BirlesimColorModel(),
        okutucuContainer: OkutucuContainer(harfList: []),
        ornekContainer: OrnekContainer(harfList: []),
        birlesimContainer: null,
      );
    }
  }
}
