// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$konuListAtom = Atom(name: '_HomeViewModel.konuList', context: context);

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

  late final _$aktifModelAtom = Atom(name: '_HomeViewModel.aktifModel', context: context);

  @override
  KonuModel? get aktifKonuModel {
    _$aktifModelAtom.reportRead();
    return super.aktifKonuModel;
  }

  @override
  set aktifKonuModel(KonuModel? value) {
    _$aktifModelAtom.reportWrite(value, super.aktifKonuModel, () {
      super.aktifKonuModel = value;
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

  late final _$isRikaAtom = Atom(name: '_HomeViewModel.isRika', context: context);

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

  late final _$initAsyncAction = AsyncAction('_HomeViewModel.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$setRikaAsyncAction =
      AsyncAction('_HomeViewModel.setRika', context: context);

  @override
  Future<void> setRika() {
    return _$setRikaAsyncAction.run(() => super.setRika());
  }

  late final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel', context: context);

  @override
  void akitfKonuAta(int index) {
    final _$actionInfo =
        _$_HomeViewModelActionController.startAction(name: '_HomeViewModel.akitfKonuAta');
    try {
      return super.akitfKonuAta(index);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
konuList: ${konuList},
aktifModel: ${aktifKonuModel},
aktifKonuId: ${aktifKonuId},
isRika: ${isRika}
    ''';
  }
}
