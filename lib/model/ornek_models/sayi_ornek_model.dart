import 'package:hayrat_osmanlica_elif_ba/model/ornek_models/harf_ornek_model.dart';

class SayiOrnekModel {
  List<dynamic> ornekList;

  SayiOrnekModel({required this.ornekList});

  // Tüm listeyi HarfOrnekModel'e çeviren metot
  List<HarfOrnekModel> toHarfModelList() {
    return ornekList.map((dynamic item) {
      return HarfOrnekModel.fromJson(item);
    }).toList();
  }
}
