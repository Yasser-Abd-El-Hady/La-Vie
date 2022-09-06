import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/provider/bottom_nav_bar.dart';
import 'package:la_vie/provider/user_profile_provider.dart';
import 'package:la_vie/services/cashe_helper.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/custom_text.dart';
import 'package:la_vie/views/screens/authentication_screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class ScanDetailsScreen extends StatelessWidget {
  ScanDetailsScreen({Key? key, this.code}) : super(key: key);
  String? code;

  @override
  Widget build(BuildContext context) {
    Screen(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Screen.screenHeight / (926 / 391),
              child: Stack(children: [
                Image.asset(
                  "assets/images/img.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ).blurred(blur: 7),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: Screen.screenHeight / (926 / 325)),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white),
                child: SizedBox(
                  height: Screen.screenHeight / (926 / (926 - 360)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: Screen.screenHeight / (926 / 25)),
                        child: Container(
                          width: Screen.screenWidth / (428 / 378),
                          height: Screen.screenHeight / (926 / 90),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF3FEF1)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Screen.screenWidth / (428 / 15)),
                            child: Row(
                              children: [
                                Image.asset("assets/images/points.png"),
                                SizedBox(
                                    width: Screen.screenWidth / (428 / 15)),
                                customText(
                                    text: "You have $points points",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(Screen.screenWidth / (428 / 30)),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: customText(
                                text: "Edit Profile",
                                fontWeight: FontWeight.w500,
                                fontSize: 24)),
                      ),
                      Container(
                        width: Screen.screenWidth / (428 / 378),
                        height: Screen.screenHeight / (926 / 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.customGrey)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Screen.screenWidth / (428 / 15)),
                          child: Row(
                            children: [
                              Image.asset("assets/images/change.png"),
                              SizedBox(width: Screen.screenWidth / (428 / 15)),
                              customText(
                                  text: "Change Name",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xff1D592C),
                                      size: 35,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Screen.screenHeight / (926 / 30)),
                      Container(
                        width: Screen.screenWidth / (428 / 378),
                        height: Screen.screenHeight / (926 / 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.customGrey)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Screen.screenWidth / (428 / 15)),
                          child: Row(
                            children: [
                              Image.asset("assets/images/change.png"),
                              SizedBox(width: Screen.screenWidth / (428 / 15)),
                              customText(
                                  text: "Change Email",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xff1D592C),
                                      size: 35,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
