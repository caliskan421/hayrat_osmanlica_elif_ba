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
  @observable
  bool isRika = true;
  @observable
  String appHat = 'rika';
  @observable
  int konuIndex = 0;

  @action
  Future<void> fetchKonular(BuildContext context) async {
    /// Todo [if-else] kontrolu olmadigi taktirde konulara tiklanildikca
    /// eleman sayisi 6'sar olarak artiyor
    /// Ustelik deger 12'den basliyor... (baslarken 2 kez build edilmesinden olabilir)
    if (konularList.length != 6) {
      for (int i = 0; i <= konularList.length; i++) {
        String konu = await _konuService.fetchIconKonuTitle(context, i);
        konularList.add(konu);
      }
    } else {
      konularList.clear();

      ///
      for (int i = 0; i <= konularList.length; i++) {
        String konu = await _konuService.fetchIconKonuTitle(context, i);
        konularList.add(konu);
      }
    }
  }

  @action
  Future<void> fetchKonuIconlar(BuildContext context) async {
    for (int i = 0; i <= konularList.length; i++) {
      String icon = await _iconService.fetchIcon(context, i, appHat);
      iconList.add(icon);
    }
  }

  @action
  Future<void> fetchDersler(BuildContext context) async {
    for (int j = 0; j <= derslerList.length; j++) {
      ///ilk [int] parametre {konu listin} ikincisi ise {ders listin} <index> degeri
      String ders = await _dersService.fetchDersTitle(context, konuIndex, j);
      derslerList.add(ders);
    }
  }

  @action
  Future<void> changeAppHat(BuildContext context) async {
    isRika = !isRika;
    appHat = isRika ? appHat = 'rika' : appHat = 'matbu';

    await fetchKonuIconlar(context);
  }
}
