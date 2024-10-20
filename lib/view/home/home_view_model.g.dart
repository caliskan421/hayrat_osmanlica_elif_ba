// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$konuListAtom =
      Atom(name: '_HomeViewModel.konuList', context: context);

  @override
  ObservableList<KonuModel> get konuList {
    _$konuListAtom.reportRead();
    return super.konuList;
  }

  @override
  set konuList(ObservableList<KonuModel> value) {
    _$konuListAtom.reportWrite(value, super.konuList, () {
      super.konuList = value;
    });
  }

  late final _$aktifDersListAtom =
      Atom(name: '_HomeViewModel.aktifDersList', context: context);

  @override
  ObservableList<DersModel> get aktifDersList {
    _$aktifDersListAtom.reportRead();
    return super.aktifDersList;
  }

  @override
  set aktifDersList(ObservableList<DersModel> value) {
    _$aktifDersListAtom.reportWrite(value, super.aktifDersList, () {
      super.aktifDersList = value;
    });
  }

  late final _$aktifKonuModelAtom =
      Atom(name: '_HomeViewModel.aktifKonuModel', context: context);

  @override
  KonuModel? get aktifKonuModel {
    _$aktifKonuModelAtom.reportRead();
    return super.aktifKonuModel;
  }

  @override
  set aktifKonuModel(KonuModel? value) {
    _$aktifKonuModelAtom.reportWrite(value, super.aktifKonuModel, () {
      super.aktifKonuModel = value;
    });
  }

  late final _$aktifDersModelAtom =
      Atom(name: '_HomeViewModel.aktifDersModel', context: context);

  @override
  DersModel? get aktifDersModel {
    _$aktifDersModelAtom.reportRead();
    return super.aktifDersModel;
  }

  @override
  set aktifDersModel(DersModel? value) {
    _$aktifDersModelAtom.reportWrite(value, super.aktifDersModel, () {
      super.aktifDersModel = value;
    });
  }

  late final _$aktifKonuIdAtom =
      Atom(name: '_HomeViewModel.aktifKonuId', context: context);

  @override
  int? get aktifKonuId {
    _$aktifKonuIdAtom.reportRead();
    return super.aktifKonuId;
  }

  @override
  set aktifKonuId(int? value) {
    _$aktifKonuIdAtom.reportWrite(value, super.aktifKonuId, () {
      super.aktifKonuId = value;
    });
  }

  late final _$aktifDersIdAtom =
      Atom(name: '_HomeViewModel.aktifDersId', context: context);

  @override
  int? get aktifDersId {
    _$aktifDersIdAtom.reportRead();
    return super.aktifDersId;
  }

  @override
  set aktifDersId(int? value) {
    _$aktifDersIdAtom.reportWrite(value, super.aktifDersId, () {
      super.aktifDersId = value;
    });
  }

  late final _$isRikaAtom =
      Atom(name: '_HomeViewModel.isRika', context: context);

  @override
  bool get isRika {
    _$isRikaAtom.reportRead();
    return super.isRika;
  }

  @override
  set isRika(bool value) {
    _$isRikaAtom.reportWrite(value, super.isRika, () {
      super.isRika = value;
    });
  }

  late final _$dersNoAtom =
      Atom(name: '_HomeViewModel.dersNo', context: context);

  @override
  int? get dersNo {
    _$dersNoAtom.reportRead();
    return super.dersNo;
  }

  @override
  set dersNo(int? value) {
    _$dersNoAtom.reportWrite(value, super.dersNo, () {
      super.dersNo = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_HomeViewModel.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$akitfKonuAtaAsyncAction =
      AsyncAction('_HomeViewModel.akitfKonuAta', context: context);

  @override
  Future<dynamic> akitfKonuAta(int index) {
    return _$akitfKonuAtaAsyncAction.run(() => super.akitfKonuAta(index));
  }

  late final _$aktifDersAtaAsyncAction =
      AsyncAction('_HomeViewModel.aktifDersAta', context: context);

  @override
  Future<void> aktifDersAta(int index) {
    return _$aktifDersAtaAsyncAction.run(() => super.aktifDersAta(index));
  }

  late final _$setRikaAsyncAction =
      AsyncAction('_HomeViewModel.setRika', context: context);

  @override
  Future<void> setRika() {
    return _$setRikaAsyncAction.run(() => super.setRika());
  }

  late final _$fetchDerslerForKonuAsyncAction =
      AsyncAction('_HomeViewModel.fetchDerslerForKonu', context: context);

  @override
  Future<List<DersModel>> fetchDerslerForKonu(KonuModel konu) {
    return _$fetchDerslerForKonuAsyncAction
        .run(() => super.fetchDerslerForKonu(konu));
  }

  @override
  String toString() {
    return '''
konuList: ${konuList},
aktifDersList: ${aktifDersList},
aktifKonuModel: ${aktifKonuModel},
aktifDersModel: ${aktifDersModel},
aktifKonuId: ${aktifKonuId},
aktifDersId: ${aktifDersId},
isRika: ${isRika},
dersNo: ${dersNo}
    ''';
  }
}
