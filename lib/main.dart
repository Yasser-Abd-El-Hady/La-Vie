import 'package:flutter/material.dart';
import 'package:la_vie/provider/authentication_provider.dart';
import 'package:la_vie/provider/bottom_nav_bar.dart';
import 'package:la_vie/provider/categories.dart';
import 'package:la_vie/provider/forums.dart';
import 'package:la_vie/provider/forums_provider.dart';
import 'package:la_vie/provider/plant_provider.dart';
import 'package:la_vie/provider/product_provider.dart';
import 'package:la_vie/provider/seed_provider.dart';
import 'package:la_vie/provider/tool_provider.dart';
import 'package:la_vie/services/cashe_helper.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:la_vie/views/screens/authentication_screens/signup_screen.dart';
import 'package:la_vie/views/screens/main_screens/app_layout_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  token = CacheHelper.getData(key: "token");
  Widget widget;
  if (token != null) {
    widget = const AppLayoutScreen();
  } else {
    widget = SignUpScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authentication>(create: (_) => Authentication()),
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
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: widget,
      ),
    );
  }
}
