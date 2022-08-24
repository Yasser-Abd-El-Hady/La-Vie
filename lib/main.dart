import 'package:flutter/material.dart';
import 'package:la_vie/provider/bottom_nav_bar.dart';
import 'package:la_vie/provider/categories.dart';
import 'package:la_vie/provider/forums.dart';
import 'package:la_vie/provider/forums_provider.dart';
import 'package:la_vie/provider/plant_provider.dart';
import 'package:la_vie/provider/product_provider.dart';
import 'package:la_vie/provider/seed_provider.dart';
import 'package:la_vie/provider/tool_provider.dart';
import 'package:la_vie/views/screens/authentication_screens/signup_screen.dart';
import 'package:la_vie/views/screens/blogs_screens/single_blog_screen.dart';
import 'package:la_vie/views/screens/forums_screens/discussion_forums_screen.dart';
import 'package:la_vie/views/screens/main_screens/app_layout_screen.dart';
import 'package:la_vie/views/screens/home_screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Seed>(create: (_) => Seed()),
        ChangeNotifierProvider<Tool>(create: (_) => Tool()),
        ChangeNotifierProvider<Plant>(create: (_) => Plant()),
        ChangeNotifierProvider<Product>(create: (_) => Product()),
        ChangeNotifierProvider<Forums>(create: (_) => Forums()),
        ChangeNotifierProvider<Categories>(create: (_) => Categories()),
        ChangeNotifierProvider<BottomNavBar>(create: (_) => BottomNavBar()),
        ChangeNotifierProvider<ForumsType>(create: (_) => ForumsType()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const AppLayoutScreen(),
      ),
    );
  }
}
