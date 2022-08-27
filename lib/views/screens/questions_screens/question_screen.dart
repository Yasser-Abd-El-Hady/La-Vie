import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/answer_item.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (34 / Screen.screenWidth) * Screen.screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 34),
                  child: Text("Course Exam",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 19))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: "Question ", style: TextStyle(fontSize: 36)),
                      TextSpan(
                          text: "1",
                          style: TextStyle(
                              color: AppColors.primary, fontSize: 36)),
                      TextSpan(
                          text: "/10",
                          style: TextStyle(
                              color: AppColors.customGrey, fontSize: 14)),
                    ]))),
            const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("What is the user experience?",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    answerItem(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value as int;
                          });
                        }),
                    answerItem(
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value as int;
                          });
                        }),
                    answerItem(
                        value: 3,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value as int;
                          });
                        }),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: const BorderSide(
                                                color: AppColors.primary,
                                                width: 2)))),
                                onPressed: () {},
                                child: const Text("Back",
                                    style:
                                        TextStyle(color: AppColors.primary)))),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.primary),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)))),
                              onPressed: () {},
                              child: const Text("Next")),
                        )
                      ],
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
