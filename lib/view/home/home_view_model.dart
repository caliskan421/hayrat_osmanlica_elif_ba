import 'package:flutter/material.dart';
import 'package:hayrat_osmanlica_elif_ba/service/dersler_service.dart';
import 'package:hayrat_osmanlica_elif_ba/service/konu_icon_service.dart';
import 'package:hayrat_osmanlica_elif_ba/service/konu_service.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class ViewModel = _ViewModelBase with _$ViewModel;

abstract class _ViewModelBase with Store {
  final KonularService _konuService = KonularService();
  final DerslerService _dersService = DerslerService();
  final KonuIconService _iconService = KonuIconService();

  @observable
  ObservableList<String> konularList = ObservableList<String>();
  @observable
  ObservableList<String> iconList = ObservableList<String>();
  @observable
  ObservableList<String> derslerList = ObservableList<String>();

  @action
  Future<void> fetchKonular(BuildContext context) async {
    for (int i = 0; i <= konularList.length; i++) {
      String konu = await _konuService.fetchIconKonuTitle(context, i);
      konularList.add(konu);
    }
  }

  @action
  Future<void> fetchKonuIconlar(BuildContext context) async {
    for (int i = 0; i <= konularList.length; i++) {
      /// Todo --> ['riksa'] degeri sbt olmayacak...
      String icon = await _iconService.fetchIcon(context, i, 'rika');
      iconList.add(icon); // Alah cezani vermeye bes
    }
  }

  @action
  Future<void> fetchDersler(BuildContext context) async {
    for (int j = 0; j <= derslerList.length; j++) {
      String ders = await _dersService.fetchDersTitle(context, 0, j);
      derslerList.add(ders);
    }
  }
}
