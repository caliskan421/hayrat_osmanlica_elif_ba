import 'package:hayrat_osmanlica_elif_ba/model/ders_model.dart';
import 'package:mobx/mobx.dart';

import '../../model/konu_model.dart';
import '../../service/konu_model_list_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final KonuModelListService _konuListService = KonuModelListService();

  @observable
  ObservableList<KonuModel> konuList = ObservableList.of([]);

  @observable
  KonuModel? aktifModel;

  @observable
  DersModel? aktifDers;

  @observable
  int? aktifKonuId = 0;

  @observable
  bool isRika = false;

  @action
  Future<void> init() async {
    konuList.clear();
    aktifModel == null;
    aktifDers == null;
    // kullanıcı tercihi hatırlanması lazım
    isRika = false;
    final res = await _konuListService.fetchKonularFromJson();
    konuList.addAll(ObservableList.of(res));
    // kullanıcının son tıkladığını kaydetip burda ataman lazım.
    aktifModel = konuList.first;
    aktifDers = konuList[aktifKonuId!].dersler.first;
  }

  @action
  void akitfKonuAta(index) {
    aktifModel = konuList[index];
  }

  @action
  void aktifDersAta(index) {
    aktifDers = konuList[aktifKonuId!].dersler[index];
  }

  @action
  void setRika({bool? value}) {
    isRika = value ?? !isRika;
  }

//
// @observable
// ObservableList<String> konularTitleList = ObservableList<String>();
// @observable
// ObservableList<String> konularIconList = ObservableList<String>();
// @observable
// ObservableList<String> derslerTitleList = ObservableList<String>();
// @observable
// bool isRika = true;
// @observable
// String appHat = 'rika';
// @observable
// int konuIndex = 0;
//
// @observable
// KonuModel? aktifKonuModel;
//
// @action
// Future<void> fetchKonuTitle(BuildContext context) async {
//   for (int i = 0; i <= konularTitleList.length; i++) {
//     _konuService.fetchKonuTitleService(context, i);
//   }
// }
//
// @action
// Future<void> fetchKonuIcon(BuildContext context) async {
//   for (int i = 0; i < konularTitleList.length; i++) {
//     String icon = await _iconService.fetchKonuIconService(context, i, appHat);
//     konularIconList.add(icon);
//   }
// }
//
// @action
// Future<void> fetchDerslerTitle(BuildContext context) async {
//   for (int j = 0; j <= derslerTitleList.length; j++) {
//     ///ilk [int] parametre {konu listin} ikincisi ise {ders listin} <index> degeri
//     String ders = await _dersService.fetchDersTitle(context, konuIndex, j);
//     derslerTitleList.add(ders);
//   }
// }
//
// @action
// Future<void> changeAppHat(BuildContext context) async {
//   isRika = !isRika;
//   appHat = isRika ? appHat = 'rika' : appHat = 'matbu';
//
//   await fetchKonuIcon(context);
// }
}
