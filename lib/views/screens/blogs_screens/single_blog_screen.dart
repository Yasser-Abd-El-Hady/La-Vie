import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/custom_text.dart';

class SingleBlogScreen extends StatefulWidget {
  const SingleBlogScreen({Key? key}) : super(key: key);

  @override
  State<SingleBlogScreen> createState() => _SingleBlogScreenState();
}

class _SingleBlogScreenState extends State<SingleBlogScreen> {
  @override
  Widget build(BuildContext context) {
    Screen(context);
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: Screen.screenWidth,
            height: Screen.screenHeight / (926 / 299),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/plant2.png"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Screen.screenHeight / (926 / 37),
                left: Screen.screenWidth / (428 / 25)),
            child: customText(
                text: "5 Simple Tips to treat plants",
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Screen.screenHeight / (926 / 22),
                left: Screen.screenWidth / (428 / 29)),
            child: customText(
                text:
                    "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.customGrey),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Screen.screenHeight / (926 / 16),
                left: Screen.screenWidth / (428 / 25)),
            child: customText(
                text:
                    "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.customGrey),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Screen.screenHeight / (926 / 16),
                left: Screen.screenWidth / (428 / 25)),
            child: customText(
                text:
                    "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.customGrey),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Screen.screenHeight / (926 / 16),
                left: Screen.screenWidth / (428 / 25)),
            child: customText(
                text:
                    "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.customGrey),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Screen.screenHeight / (926 / 16),
                left: Screen.screenWidth / (428 / 25)),
            child: customText(
                text:
                    "leaf, in botany, any usually flattened green outgrowth from the stem of  ",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.customGrey),
          ),
        ]),
      ),
    );
  }
}
