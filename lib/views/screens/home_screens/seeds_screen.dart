import 'package:flutter/material.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../provider/seed_provider.dart';
import '../../../utils/screen.dart';

class SeedsScreen extends StatelessWidget {
  const SeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Seed>(context).allSeeds;
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 176 / 274,
              crossAxisSpacing: (14 / Screen.screenWidth) * Screen.screenWidth,
              mainAxisSpacing: 5),
          itemCount: Provider.of<Seed>(context).allSeeds.length,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: index % 2 == 0
                  ? EdgeInsets.only(
                      left: (18 / Screen.screenWidth) * Screen.screenWidth)
                  : EdgeInsets.only(
                      right: (18 / Screen.screenWidth) * Screen.screenWidth),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                child: Stack(fit: StackFit.expand, children: [
                  Column(
                    children: [
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 6,
                          child: Material(
                            elevation: 6,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Container(),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: provider[index].imageUrl == ""
                                    ? Image.asset("assets/images/55.png")
                                    : Image.network(
                                        url + provider[index].imageUrl!,
                                        width: double.infinity,
                                        height:
                                            Screen.screenHeight / (926 / 170),
                                        fit: BoxFit.cover,
                                      ),
                              ))),
                      const SizedBox(height: 6),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  provider[index].name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "${70} EGP",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 25,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  )),
                                              child: const Center(
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Screen.screenWidth * 0.01,
                                          ),
                                          const Text("1"),
                                          SizedBox(
                                            width: Screen.screenWidth * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 25,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  )),
                                              child: const Center(
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("Add to cart"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff1ABC00)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    )))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
