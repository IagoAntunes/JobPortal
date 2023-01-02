import 'package:mobx/mobx.dart';

part 'menus.store.g.dart';

class MenusStore = _MenusStore with _$MenusStore;

abstract class _MenusStore with Store {
  final List<String> menus = [
    'Discover',
    'Saved',
    'Applied',
    'Closed',
    'Discarded'
  ];

  @observable
  String selectedMenu = 'Discover';

  @action
  void changeSelectedMenu(String newSelected) {
    selectedMenu = newSelected;
  }
}
