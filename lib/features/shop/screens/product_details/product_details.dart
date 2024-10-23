import 'package:ecomm/common/widgets/texts/head_section.dart';
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
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductDetailImageSlider(),
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
                  const ProductMetaData()
                  // - attriburtes
                  ,
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 1.7,
                  ),
                  const ProductAttributes(),
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
                  const ReadMoreText(
                    '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more 
''',
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
