import 'package:mobx/mobx.dart';

/// Model
import '../../model/konu_model.dart';
import '../../model/ders_model.dart';

import '../../service/ders_service.dart';
import '../../service/konu_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final KonuService _konuListService = KonuService();
  final DersService _dersListService = DersService();

  @observable
  ObservableList<KonuModel> konuList = ObservableList.of([]);

  /// aktifKonuModel'e gore listelenen DersModel'ler
  @observable
  ObservableList<DersModel> aktifDersList = ObservableList.of([]);

  @observable
  KonuModel? aktifKonuModel;

  @observable
  DersModel? aktifDersModel;

  @observable
  int? aktifKonuId = 0;

  @observable
  int? aktifDersId;

  @observable
  bool isRika = false;

  @observable
  int? dersNo;

  @action
  Future<void> init() async {
    // Konu ve ders listelerini temizleyerek başla
    ///konuList.clear();
    //aktifKonuModel = null;

    // isRika durumunu kaydedilmiş halinden al
    isRika = await _dersListService.getIsRika();

    // Son kaydedilen aktif dersin ID'sini al
    aktifDersId = await _dersListService.getDersId();

    // Tüm konuları JSON'dan yükle
    final konular = await _konuListService.fetchKonularFromJson();
    konuList.addAll(ObservableList.of(konular));

    // Eğer bir aktif ders varsa, bu dersin ait olduğu konuyu bul ve aktif konu olarak ata
    if (aktifDersId != null) {
      // Ders ID'sini içeren konuyu bul
      for (var konu in konuList) {
        if (konu.dersIdleri.contains(aktifDersId)) {
          aktifKonuModel = konu;
          break;
        }
      }

      // Eğer aktif dersin bağlı olduğu konu bulunmuşsa, derslerini de yükle
      if (aktifKonuModel != null) {
        final dersler = await fetchDerslerForKonu(aktifKonuModel!);
        aktifDersList = ObservableList.of(dersler);
      }
    }

    // Eğer aktif ders yoksa veya aktif dersin konusunu bulamadıysak, en son kaydedilen aktif konuyu yükle
    if (aktifKonuModel == null) {
      final sonKonuId = await _konuListService.getKonuId();
      aktifKonuModel = konuList[sonKonuId];
      final dersler = await fetchDerslerForKonu(aktifKonuModel!);
      aktifDersList = ObservableList.of(dersler);
    }
  }

  @action
  Future akitfKonuAta(int index) async {
    //log('Seçilen Konu ID: ${konuList[index].id}');
    aktifKonuModel = konuList[index];

    /// aktifKonu'yu [Id]si uzerinden locale kaydediyoruz
    _konuListService.saveKonuId(index);

    /// Seçilen konunun derslerini çek ve güncelle
    final dersler = await fetchDerslerForKonu(aktifKonuModel!);
    aktifDersList = ObservableList.of(dersler);
  }

  @action
  Future<void> aktifDersAta(int index) async {
    aktifDersId = aktifKonuModel!.dersIdleri[index];

    /// DersModel'i async olarak [fetchDersById] ile çekiyoruz
    final dersJson = await _dersListService.fetchDersById(aktifDersId!);

    /// Çekilen JSON'u DersModel'e dönüştürüyoruz
    aktifDersModel = DersModel.fromJson(dersJson);

    /// aktifDers'i [Id]si uzerinden locale kaydediyoruz
    _dersListService.saveDersId(aktifDersId!);
  }

  @action
  Future<void> setRika() async {
    isRika = !isRika;
    await _dersListService.saveIsRika(isRika);
  }

  @action
  Future<List<DersModel>> fetchDerslerForKonu(KonuModel konu) async {
    /// Secilen konuya gore ders id'leri uzerinden
    /// o konu altinda yer alan dersleri DerModele donusturup
    /// List seklinde donduren method...
    List<DersModel> dersModels = [];
    for (int dersId in konu.dersIdleri) {
      final dersJson = await _dersListService.fetchDersById(dersId);
      DersModel dersModel = DersModel.fromJson(dersJson);
      dersModels.add(dersModel);
    }
    //log(dersModels.toString());
    return dersModels;
  }
}
