import 'package:hayrat_osmanlica_elif_ba/model/ders_model.dart';
import 'package:mobx/mobx.dart';

/// Model
import '../../model/konu_model.dart';

/// Service
import '../../service/ders_state_servcice.dart';
import '../../service/hat_state_service.dart';
import '../../service/konu_model_list_service.dart';
import '../../service/konu_state_serive.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final KonuModelListService _konuListService = KonuModelListService();
  final HatStateService _hatStateService = HatStateService();
  final KonuStateService _konuStateService = KonuStateService();
  final DersStateService _dersStateService = DersStateService();

  @observable
  ObservableList<KonuModel> konuList = ObservableList.of([]);

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
  void akitfKonuAta(int index) {
    aktifKonuModel = konuList[index];
    _konuStateService.saveKonuId(index);
  }

  @action
  void aktifDersAta(int index) {
    aktifDersId = aktifKonuModel!.dersler[index].id;
    aktifDers = aktifKonuModel!.dersler[index];
    _dersStateService.saveDersId(aktifDersId ?? 0);
  }

  @action
  Future<void> setRika() async {
    isRika = !isRika;
    await _hatStateService.saveIsRika(isRika);
  }
}
