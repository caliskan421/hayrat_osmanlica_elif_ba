// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailViewModel on _DetailViewModel, Store {
  late final _$aktifDersModelAtom =
      Atom(name: '_DetailViewModel.aktifDersModel', context: context);

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

  late final _$_DetailViewModelActionController =
      ActionController(name: '_DetailViewModel', context: context);

  @override
  void init(DersModel dersModel) {
    final _$actionInfo = _$_DetailViewModelActionController.startAction(
        name: '_DetailViewModel.init');
    try {
      return super.init(dersModel);
    } finally {
      _$_DetailViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
aktifDersModel: ${aktifDersModel}
    ''';
  }
}
