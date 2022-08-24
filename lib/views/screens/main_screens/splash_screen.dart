import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                const Center(
                  child: Text(
                    "La Vie",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Meddon"),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/1.png',
                  ),
                  heightFactor: 3,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
