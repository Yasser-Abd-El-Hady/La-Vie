import 'package:flutter/material.dart';
import 'package:la_vie/models/cart_model/mycart.dart';
import 'package:la_vie/provider/cart_provider.dart';
import 'package:la_vie/services/cashe_helper.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:la_vie/views/components/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../provider/seed_provider.dart';
import '../../../utils/screen.dart';

class SeedsScreen extends StatelessWidget {
  const SeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Seed>(context).allSeeds;
    return provider.isEmpty
        ? const Expanded(child: Center(child: CircularProgressIndicator()))
        : Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 176 / 274,
                    crossAxisSpacing:
                        (14 / Screen.screenWidth) * Screen.screenWidth,
                    mainAxisSpacing: 5),
                itemCount: provider.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: index % 2 == 0
                        ? EdgeInsets.only(
                            left:
                                (18 / Screen.screenWidth) * Screen.screenWidth)
                        : EdgeInsets.only(
                            right:
                                (18 / Screen.screenWidth) * Screen.screenWidth),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Stack(fit: StackFit.expand, children: [
                        Column(
                          children: [
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 6,
                                child: Material(
                                  elevation: 6,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
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
                                          ? Image.asset(
                                              "assets/images/plant5.png")
                                          : Image.network(
                                              url + provider[index].imageUrl!,
                                              width: double.infinity,
                                              height: Screen.screenHeight /
                                                  (926 / 170),
                                              fit: BoxFit.cover,
                                            ),
                                    ))),
                            const SizedBox(height: 6),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                            "${120} EGP",
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
                                                  onTap: () {
                                                    Provider.of<Cart>(context,
                                                            listen: false)
                                                        .updateCart(
                                                            provider[index]
                                                                .seedId!,
                                                            "-");
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(5),
                                                        )),
                                                    child: const Center(
                                                      child: Text(
                                                        "-",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Screen.screenWidth * 0.01,
                                                ),
                                                customText(
                                                    text:
                                                        "${Provider.of<Cart>(context).getCount(provider[index].seedId!)}",
                                                    fontWeight:
                                                        FontWeight.bold),
                                                SizedBox(
                                                  width:
                                                      Screen.screenWidth * 0.01,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Provider.of<Cart>(context,
                                                            listen: false)
                                                        .updateCart(
                                                            provider[index]
                                                                .seedId!,
                                                            "+");
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(5),
                                                        )),
                                                    child: const Center(
                                                      child: Text(
                                                        "+",
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                      onPressed: Provider.of<Cart>(context)
                                                  .getCount(provider[index]
                                                      .seedId!) ==
                                              0
                                          ? () {
                                              Provider.of<Cart>(context,
                                                      listen: false)
                                                  .addToCart(
                                                MyCart(
                                                  productId:
                                                      provider[index].seedId,
                                                  userId: CacheHelper.getData(
                                                      key: "userId"),
                                                  name: provider[index].name,
                                                  imageUrl: provider[index]
                                                          .imageUrl ??
                                                      "/uploads/1d9ee5fb-e3b8-4b72-bce0-c6874e4b4a84.jpg",
                                                  price: 120,
                                                  count: 1,
                                                ),
                                              );
                                            }
                                          : null,
                                      child: const Text("Add to cart"),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xff1ABC00)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
