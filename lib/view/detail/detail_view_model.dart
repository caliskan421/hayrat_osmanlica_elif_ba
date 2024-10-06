import 'package:hayrat_osmanlica_elif_ba/model/ders_model.dart';
import 'package:hayrat_osmanlica_elif_ba/view/home/home_view.dart';
import 'package:mobx/mobx.dart';

part 'detail_view_model.g.dart';

class DetailViewModel = _DetailViewModel with _$DetailViewModel;

abstract class _DetailViewModel with Store {
  @observable
  DersModel? aktifDersModel;

  @action
  void init() {
    aktifDersModel = homeViewModel.aktifDersModel!;
  }
}
