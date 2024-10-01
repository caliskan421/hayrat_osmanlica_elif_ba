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
  int? aktifKonuId = 0;

  @observable
  bool isRika = false;

  @action
  Future<void> init() async {
    konuList.clear();
    aktifModel == null;
    // kullanıcı tercihi hatırlanması lazım
    isRika = false;
    final res = await _konuListService.fetchKonularFromJson();
    konuList.addAll(ObservableList.of(res));
    // kullanıcının son tıkladığını kaydetip burda ataman lazım.
    aktifModel = konuList.first;
  }

  @action
  void akitfKonuAta(index) {
    aktifModel = konuList[index];
  }

  @action
  void setRika({bool? value}) {
    isRika = value ?? !isRika;
  }
}
