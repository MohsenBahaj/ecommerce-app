import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/curved_edge/curved_edge_widget.dart';
import 'package:ecomm/common/widgets/icons/circular_icon.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/features/shop/controllers/product/image_controller.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    final controller = ImageController.instance;
    final images = controller.getAllProductImages(product);

    return Container(
      color: dark ? AppColors.darkGrey : AppColors.white,
      child: Stack(
        children: [
          SizedBox(
            height: 370,
            child: Center(
              child: Obx(() {
                final image = controller.selectedProdcutImage.value;
                return GestureDetector(
                  onTap: () {
                    controller.showEnlargedImage(image);
                  },
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageUrl: image,
                    progressIndicatorBuilder: (_, __, downloadProgress) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: AppColors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
          // Image Slider
          Positioned(
            right: 0,
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: width,
                height: 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  // Wrap the Row in a Container with the full screen width
                  child: Container(
                    width: width,
                    child: Row(
                      // If 3 or fewer images, center them; otherwise, align to the start.
                      mainAxisAlignment: images.length <= 3
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: images.map((imageUrl) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceBtwItem / 2),
                          child: Obx(() {
                            final imageSelected =
                                controller.selectedProdcutImage.value ==
                                    imageUrl;
                            return GestureDetector(
                              onTap: () {
                                controller.selectedProdcutImage.value =
                                    imageUrl;
                              },
                              child: AppRoundedImage(
                                bakcgroundColor:
                                    dark ? AppColors.dark : AppColors.white,
                                imageUrl: imageUrl,
                                isNetworkImage: true,
                                border: Border.all(
                                    color: imageSelected
                                        ? AppColors.primary
                                        : Colors.transparent),
                                borderRadius: 10,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const CustomAppBar(
            showBackArrow: true,
            action: [
              CircularIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
