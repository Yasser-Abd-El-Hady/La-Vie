import 'package:flutter/material.dart';
import 'package:la_vie/views/screens/home_screens/home_screen.dart';

class ForumsType with ChangeNotifier {
  String _pageSelected = "all";

  String get pageSelected => _pageSelected;

  void changePage(String page) {
    _pageSelected = page;
    notifyListeners();
  }
}
