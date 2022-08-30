import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Screen.screenHeight / (926 / 345),
              child: Stack(children: [
                Image.asset(
                  "assets/images/img.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ).blurred(blur: 7),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Screen.screenHeight / (926 / 25),
                          right: Screen.screenWidth / (428 / 25),
                          left: Screen.screenWidth / (428 / 25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              child: const Icon(Icons.arrow_back,
                                  size: 35, color: Colors.white),
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                          InkWell(
                              child: const Icon(Icons.more_horiz,
                                  size: 35, color: Colors.white),
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("assets/images/img.jpg")),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: customText(
                          text: "Yasser Abdelhady",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                )
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
                            top: Screen.screenHeight / (926 / 31)),
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
                                    text: "You have 30 points",
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
                        height: Screen.screenHeight / (926 / 110),
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
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff1D592C),
                                    size: 35,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Screen.screenHeight / (926 / 35)),
                      Container(
                        width: Screen.screenWidth / (428 / 378),
                        height: Screen.screenHeight / (926 / 110),
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
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff1D592C),
                                    size: 35,
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
