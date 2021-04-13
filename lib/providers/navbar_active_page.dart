import 'package:flutter/foundation.dart';

class NavBarActivePage extends ChangeNotifier {
  String _pageName;

  NavBarActivePage(this._pageName);

  String get pageName => _pageName;

  void changePageName(String newName) {
    _pageName = newName;

    notifyListeners();
  }
}
