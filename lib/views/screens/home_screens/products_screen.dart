import 'package:flutter/material.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../provider/product_provider.dart';
import '../../../utils/screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Product>(context).allProducts;
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 176 / 274,
              crossAxisSpacing: (14 / Screen.screenWidth) * Screen.screenWidth,
              mainAxisSpacing: 5),
          itemCount: Provider.of<Product>(context).allProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            // provider[index].plant != null
            //     ? currentProduct = provider[index].plant
            //     : provider[index].seed != null
            //         ? currentProduct = provider[index].seed
            //         : currentProduct = provider[index].tool;
            // print("ytgtgggyytyv $currentProduct");

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
                          flex: 4,
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
                          flex: 4,
                          child: Stack(clipBehavior: Clip.none, children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: provider[index].imageUrl == ""
                                    ? Image.asset("assets/images/55.png")
                                    : Image.network(
                                        url + provider[index].imageUrl!)),
                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])),
                      const SizedBox(height: 6),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  provider[index].name ==
                                          "Vegetable Garden Seeds "
                                      ? "Vegetable Seeds"
                                      : provider[index].name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "${provider[index].price} EGP",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
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
