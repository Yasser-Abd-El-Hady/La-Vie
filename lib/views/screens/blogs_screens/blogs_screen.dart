import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/custom_text.dart';

import '../../components/custom_text.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  Widget build(BuildContext context) {
    Screen(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: Screen.screenHeight / (926 / 44),
              right: Screen.screenWidth / (428 / 24),
              left: Screen.screenWidth / (428 / 24)),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Stack(
                    children: [
                      const Icon(Icons.arrow_back),
                      Align(
                        alignment: Alignment.topCenter,
                        child: customText(
                          text: "Blogs",
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              SizedBox(height: Screen.screenHeight / (926 / 10)),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(
                            bottom: Screen.screenHeight / (926 / 21)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: SizedBox(
                          width: Screen.screenWidth / (428 / 373),
                          height: Screen.screenHeight / (926 / 161),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: Screen.screenHeight / (926 / 14),
                                        bottom:
                                            Screen.screenHeight / (926 / 14),
                                        left: Screen.screenWidth / (428 / 11)),
                                    child:
                                        Image.asset("assets/images/plant3.png"),
                                  )),
                              Expanded(
                                  flex: 8,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Screen.screenWidth / (428 / 23)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                            text: "2 days ago",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primary),
                                        customText(
                                            text: "5 Tips to treat plants",
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                        customText(
                                            text:
                                                "leaf, in botany, any usually ",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.customGrey),
                                        customText(
                                            text:
                                                "leaf, in botany, any usually ",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.customGrey),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
