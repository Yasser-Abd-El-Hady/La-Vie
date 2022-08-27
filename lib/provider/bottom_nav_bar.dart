import 'package:flutter/material.dart';
import 'package:la_vie/views/screens/forums_screens/discussion_forums_screen.dart';
import 'package:la_vie/views/screens/home_screens/home_screen.dart';

import '../views/screens/cart_screens/cart_screen.dart';
import '../views/screens/notification_screens/notification_screen.dart';
import '../views/screens/questions_screens/question_screen.dart';

class BottomNavBar with ChangeNotifier {
  int _selectedPage = 2;

  final List<Widget> _pages = [
    const DiscussionForumsScreen(),
    const CartScreen(),
    HomeScreen(),
    const NotificationScreen(),
    const QuestionScreen()
  ];

  int get selectedPage => _selectedPage;
  List<Widget> get pages => _pages;

  void changeSelected(int x) {
    _selectedPage = x;
    notifyListeners();
  }
}
