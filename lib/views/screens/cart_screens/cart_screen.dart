import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';

import '../../components/custom_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int i = 1;
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
                          text: "My Cart",
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
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(
                            bottom: Screen.screenHeight / (926 / 21)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
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
                                        Image.asset("assets/images/plant2.png"),
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
                                            text: "Cactus plant",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        customText(
                                            text: "200 EGP",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primary),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: Screen.screenWidth /
                                                  (428 / 67),
                                              height: Screen.screenHeight /
                                                  (926 / 35),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        i--;
                                                      });
                                                    },
                                                    child: Center(
                                                      child: customText(
                                                          text: "-",
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .primary),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Screen.screenWidth *
                                                        0.01,
                                                  ),
                                                  Text("$i"),
                                                  SizedBox(
                                                    width: Screen.screenWidth *
                                                        0.01,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        i++;
                                                      });
                                                    },
                                                    child: Center(
                                                      child: customText(
                                                          text: "+",
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .primary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: Screen.screenWidth /
                                                      (428 / 8)),
                                              child: const Icon(Icons.delete,
                                                  color: AppColors.primary),
                                            )
                                          ],
                                        )
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
