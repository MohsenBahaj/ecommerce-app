import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/features/shop/controllers/product/product_controller.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecomm/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecomm/features/shop/screens/product_reviews/product_reiview.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailImageSlider(
              product: product,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                children: [
                  // - Rating and share
                  const RatingShareWidget(),
                  //  - price ,Title and stock and brand
                  ProductMetaData(
                    product: product,
                  )
                  // - attriburtes
                  ,
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 1.7,
                  ),
                  if (product.productType == ProductType.variable.toString())
                    ProductAttributes(
                      product: product,
                    ),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  // - CheckOut Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  // - Description
                  const AppSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  )
                  // - Reviews
                  ,
                  const Divider(),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppSectionHeading(
                        title: 'Reviews (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => const ProductReviewsScreen());
                          },
                          icon: const Icon(
                            Iconsax.arrow_right_34,
                            size: 18,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
