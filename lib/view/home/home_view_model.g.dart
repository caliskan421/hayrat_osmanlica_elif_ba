// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewModel on _ViewModelBase, Store {
  late final _$konularListAtom =
      Atom(name: '_ViewModelBase.konularList', context: context);

  @override
  ObservableList<String> get konularList {
    _$konularListAtom.reportRead();
    return super.konularList;
  }

  @override
  set konularList(ObservableList<String> value) {
    _$konularListAtom.reportWrite(value, super.konularList, () {
      super.konularList = value;
    });
  }

  late final _$iconListAtom =
      Atom(name: '_ViewModelBase.iconList', context: context);

  @override
  ObservableList<String> get iconList {
    _$iconListAtom.reportRead();
    return super.iconList;
  }

  @override
  set iconList(ObservableList<String> value) {
    _$iconListAtom.reportWrite(value, super.iconList, () {
      super.iconList = value;
    });
  }

  late final _$derslerListAtom =
      Atom(name: '_ViewModelBase.derslerList', context: context);

  @override
  ObservableList<String> get derslerList {
    _$derslerListAtom.reportRead();
    return super.derslerList;
  }

  @override
  set derslerList(ObservableList<String> value) {
    _$derslerListAtom.reportWrite(value, super.derslerList, () {
      super.derslerList = value;
    });
  }

  late final _$fetchKonularAsyncAction =
      AsyncAction('_ViewModelBase.fetchKonular', context: context);

  @override
  Future<void> fetchKonular(BuildContext context) {
    return _$fetchKonularAsyncAction.run(() => super.fetchKonular(context));
  }

  late final _$fetchKonuIconlarAsyncAction =
      AsyncAction('_ViewModelBase.fetchKonuIconlar', context: context);

  @override
  Future<void> fetchKonuIconlar(BuildContext context) {
    return _$fetchKonuIconlarAsyncAction
        .run(() => super.fetchKonuIconlar(context));
  }

  late final _$fetchDerslerAsyncAction =
      AsyncAction('_ViewModelBase.fetchDersler', context: context);

  @override
  Future<void> fetchDersler(BuildContext context) {
    return _$fetchDerslerAsyncAction.run(() => super.fetchDersler(context));
  }

  @override
  String toString() {
    return '''
konularList: ${konularList},
iconList: ${iconList},
derslerList: ${derslerList}
    ''';
  }
}
