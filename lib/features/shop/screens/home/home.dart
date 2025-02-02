import 'package:ecomm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecomm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/products.cart/product_cards.dart/product_card_vertical.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/features/shop/screens/all_products/all_product.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:ecomm/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecomm/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          //header
          const AppPrimaryHeaderContainer(
            child: Column(
              children: [
                //appbar
                HomeAppBar(),
                SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                // SearchBar
                AppSearchContainer(
                  text: 'Search in Store',
                ),
                SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                //Categories
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: AppColors.white,
                      ),
                      SizedBox(
                        height: AppSizes.spaceBtwItem,
                      ),
                      HomeCategories(),
                      SizedBox(
                        height: AppSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider(
                    banners: const [
                      AppImageAsset.banner1,
                      AppImageAsset.banner2,
                      AppImageAsset.banner3,
                      AppImageAsset.banner4,
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  AppSectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () {
                      Get.to(() => const AllProducts());
                    },
                    // textColor: dark ? AppColors.white : AppColors.dark
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  GridLayout(
                    itemCount: 8,
                    itemBuilder: (_, index) {
                      if (index == 2) {
                        return const ProductCardVertical(
                          text: 'fdsf jdnfs jdf d sfkjhdf fsdf dsfs   dfds',
                        );
                      }
                      return const ProductCardVertical(
                        text: '',
                      );
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
