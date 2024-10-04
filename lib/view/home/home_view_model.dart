import 'dart:developer';

import 'package:mobx/mobx.dart';

/// Model
import '../../model/konu_model.dart';
import '../../model/ders_model.dart';

/// Service
import '../../service/konu_model_list_service.dart';
import '../../service/konu_state_serive.dart';
import '../../service/ders_model_list_service.dart';
import '../../service/ders_state_servcice.dart';
import '../../service/hat_state_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final KonuModelListService _konuListService = KonuModelListService();
  final HatStateService _hatStateService = HatStateService();
  final KonuStateService _konuStateService = KonuStateService();
  final DersStateService _dersStateService = DersStateService();
  final DersModelListService _dersListService = DersModelListService();

  @observable
  ObservableList<KonuModel> konuList = ObservableList.of([]);
  @observable
  ObservableList<DersModel> aktifDersList = ObservableList.of([]);

  @observable
  KonuModel? aktifKonuModel;

  @observable
  DersModel? aktifDers;

  @observable
  int? aktifKonuId = 0;

  @observable
  int? aktifDersId;

  @observable
  bool isRika = false;

  @action
  Future<void> init() async {
    konuList.clear();
    aktifKonuModel = null;
    isRika = await _hatStateService.getIsRika();
    aktifDersId = await _dersStateService.getDersId();
    final res = await _konuListService.fetchKonularFromJson();
    konuList.addAll(ObservableList.of(res));
    aktifKonuModel = konuList[await _konuStateService.getKonuId()];
  }

  @action
  void akitfKonuAta(int index) async {
    aktifKonuModel = konuList[index];
    _konuStateService.saveKonuId(index);

    // Seçilen konunun derslerini çek ve güncelle
    final dersler = await fetchDerslerForKonu(aktifKonuModel!);
    aktifDersList = ObservableList.of(dersler); // Bu listeyi UI'da kullanacaksın
  }

  @action
  void aktifDersAta(int index) {
    aktifDersId = aktifKonuModel!.dersIdleri[index];
    _dersStateService.saveDersId(aktifDersId ?? 0);
  }

  @action
  Future<void> setRika() async {
    isRika = !isRika;
    await _hatStateService.saveIsRika(isRika);
  }

  @action
  Future<List<DersModel>> fetchDerslerForKonu(KonuModel konu) async {
    List<DersModel> dersModels = [];
    for (int dersId in konu.dersIdleri) {
      final dersJson = await _dersListService.fetchDersById(dersId);
      log('Ders JSON: $dersJson'); // Burada veriyi logluyoruz
      DersModel dersModel = DersModel.fromJson(dersJson);
      dersModels.add(dersModel);
    }
    log('Toplam ders sayısı: ${dersModels.length}');
    return dersModels;
  }
}
