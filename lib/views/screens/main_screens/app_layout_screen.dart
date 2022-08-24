import 'package:flutter/material.dart';
import 'package:la_vie/provider/bottom_nav_bar.dart';
import 'package:la_vie/provider/forums.dart';
import 'package:la_vie/provider/forums_provider.dart';
import 'package:la_vie/provider/product_provider.dart';
import 'package:la_vie/provider/seed_provider.dart';
import 'package:la_vie/provider/tool_provider.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/views/screens/cart_screens/cart_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:la_vie/views/screens/home_screens/home_screen.dart';
import 'package:la_vie/views/screens/notification_screens/notificationScreen.dart';
import 'package:la_vie/views/screens/questions_screens/question_screen.dart';
import 'package:la_vie/views/screens/search_screens/result_not_found.dart';
import 'package:provider/provider.dart';

import '../../../provider/plant_provider.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavBar>(context, listen: false);
    print("huuuuuuuuuuuuuuuuuuu");
    Provider.of<Seed>(context, listen: false).getAllSeeds();
    Provider.of<Tool>(context, listen: false).getAllTools();
    Provider.of<Plant>(context, listen: false).getAllPlants();
    Provider.of<Product>(context, listen: false).getAllProducts();
    Provider.of<Forums>(context, listen: false).getAllForums();
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 10,
        child: CurvedNavigationBar(
          index: 2,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.eco_outlined,
                size: 30,
                color: provider.selectedPage == 0 ? Colors.white : null),
            Icon(Icons.qr_code_scanner,
                size: 30,
                color: provider.selectedPage == 1 ? Colors.white : null),
            Icon(Icons.home_outlined,
                size: 30,
                color: provider.selectedPage == 2 ? Colors.white : null),
            Icon(Icons.notifications_none,
                size: 30,
                color: provider.selectedPage == 3 ? Colors.white : null),
            Icon(Icons.perm_identity,
                size: 30,
                color: provider.selectedPage == 4 ? Colors.white : null),
          ],
          color: AppColors.secondary,
          buttonBackgroundColor: const Color(0xff1ABC00),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            provider.changeSelected(index);
          },
          // letIndexChange: (index) => true,
        ),
      ),
      body: provider.pages[Provider.of<BottomNavBar>(context).selectedPage],
    );
  }
}