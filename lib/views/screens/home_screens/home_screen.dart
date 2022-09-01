import 'package:flutter/material.dart';
import 'package:la_vie/provider/categories.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/categories.dart';
import 'package:la_vie/views/screens/cart_screens/cart_screen.dart';
import 'package:la_vie/views/screens/home_screens/plants_screen.dart';
import 'package:la_vie/views/screens/home_screens/products_screen.dart';
import 'package:la_vie/views/screens/home_screens/seeds_screen.dart';
import 'package:la_vie/views/screens/home_screens/tools_screen.dart';
import 'package:provider/provider.dart';

enum Category { all, plants, seeds, tools }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: (50 / Screen.screenHeight) * Screen.screenHeight),
        ),
        Stack(
          children: [
            const Center(
              child: Text(
                "La Vie",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Meddon"),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/1.png',
                width: 23,
                height: 15.04,
              ),
              heightFactor: 2.5,
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (16 / Screen.screenWidth) * Screen.screenWidth,
                vertical: (25 / Screen.screenHeight) * Screen.screenHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Material(
                    elevation: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.secondary,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.search, color: AppColors.customGrey),
                            hintText: 'Search',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primary,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (16 / Screen.screenWidth) * Screen.screenWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoryWidget(
                  categorySelected:
                      Provider.of<Categories>(context).selectedCategory,
                  value: "all",
                  onTap: () {
                    if (Provider.of<Categories>(context, listen: false)
                            .selectedCategory !=
                        Category.all) {
                      Provider.of<Categories>(context, listen: false)
                          .changeSelectedCategory(Category.all);
                    }
                  }),
              categoryWidget(
                  categorySelected:
                      Provider.of<Categories>(context).selectedCategory,
                  value: "plants",
                  onTap: () {
                    if (Provider.of<Categories>(context, listen: false)
                            .selectedCategory !=
                        Category.plants) {
                      Provider.of<Categories>(context, listen: false)
                          .changeSelectedCategory(Category.plants);
                    }
                  }),
              categoryWidget(
                  categorySelected:
                      Provider.of<Categories>(context).selectedCategory,
                  value: "seeds",
                  onTap: () {
                    if (Provider.of<Categories>(context, listen: false)
                            .selectedCategory !=
                        Category.seeds) {
                      Provider.of<Categories>(context, listen: false)
                          .changeSelectedCategory(Category.seeds);
                    }
                  }),
              categoryWidget(
                  categorySelected:
                      Provider.of<Categories>(context).selectedCategory,
                  value: "tools",
                  onTap: () {
                    if (Provider.of<Categories>(context, listen: false)
                            .selectedCategory !=
                        Category.tools) {
                      Provider.of<Categories>(context, listen: false)
                          .changeSelectedCategory(Category.tools);
                    }
                  }),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Provider.of<Categories>(context).selectedCategory == Category.all
            ? const ProductsScreen()
            : Provider.of<Categories>(context).selectedCategory ==
                    Category.seeds
                ? const SeedsScreen()
                : Provider.of<Categories>(context).selectedCategory ==
                        Category.tools
                    ? const ToolsScreen()
                    : const PlantsScreen()
      ]),
    );
  }
}
