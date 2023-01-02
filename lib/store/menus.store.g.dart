// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menus.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenusStore on _MenusStore, Store {
  late final _$selectedMenuAtom =
      Atom(name: '_MenusStore.selectedMenu', context: context);

  @override
  String get selectedMenu {
    _$selectedMenuAtom.reportRead();
    return super.selectedMenu;
  }

  @override
  set selectedMenu(String value) {
    _$selectedMenuAtom.reportWrite(value, super.selectedMenu, () {
      super.selectedMenu = value;
    });
  }

  late final _$_MenusStoreActionController =
      ActionController(name: '_MenusStore', context: context);

  @override
  void changeSelectedMenu(String newSelected) {
    final _$actionInfo = _$_MenusStoreActionController.startAction(
        name: '_MenusStore.changeSelectedMenu');
    try {
      return super.changeSelectedMenu(newSelected);
    } finally {
      _$_MenusStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMenu: ${selectedMenu}
    ''';
  }
}
