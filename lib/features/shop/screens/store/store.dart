import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/appbar/tabbar.dart';
import 'package:ecomm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products.cart/cart/cart_menu_icon.dart';
import 'package:ecomm/common/widgets/brand/brandCard.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/features/shop/screens/brand/all_brands.dart';
import 'package:ecomm/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            CartCounterIcon(
              onPressed: () {},
              iconColor: dark ? AppColors.white : AppColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: AppHelperFunctions.isDarkMode(context)
                    ? AppColors.black
                    : AppColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: AppSizes.spaceBtwItem,
                      ),
                      const AppSearchContainer(
                        text: 'Search in Store',
                        showBackground: false,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: AppSizes.defaultSpace,
                      ),
                      AppSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () {
                          Get.to(() => const AllBrands());
                        },
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBtwItem / 1.5,
                      ),
                      GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 70,
                          itemBuilder: (_, index) {
                            return const BrandCard(
                              showBorder: true,
                            );
                          }),
                    ],
                  ),
                ),
                bottom: const AppBarTab(tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ]),
              ),
            ];
          },
          body: const TabBarView(children: [
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
          ]),
        ),
      ),
    );
  }
}
