// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomm/common/widgets/shimmers/shimmer.dart';
import 'package:ecomm/features/shop/controllers/banner_controller.dart/banners_controller.dart';
import 'package:ecomm/features/shop/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/images/rounded_image.dart';
import 'package:ecomm/features/shop/controllers/home_controller.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  PromoSlider({
    super.key,
  });
  final controller = Get.put(HomeController());
  final bannerController = BannersController.instance;
  @override
  Widget build(BuildContext context) {
    final List<BannerModel> banners = bannerController.allBanners;
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        CarouselSlider(
            items: banners
                .map((url) => AppRoundedImage(
                      imageUrl: url.imageUrl,
                      applyImageRaduis: true,
                      borderRadius: AppSizes.md,
                      isNetworkImage: true,
                      width: size.width - 30,
                      height: 200,
                    ))
                .toList(),
            options: CarouselOptions(
                onPageChanged: (index, _) {
                  controller.updatePageIndicator(index);
                },
                viewportFraction: 1)),
        const SizedBox(
          height: AppSizes.spaceBtwItem,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularContainer(
                  height: 5,
                  width: banners.length > 7 ? 7 : 20,
                  background: controller.carousalCurrentIndex.value == i
                      ? AppColors.primary
                      : AppColors.grey,
                  margin: EdgeInsets.only(right: banners.length > 7 ? 5 : 10),
                ),
            ],
          ),
        )
      ],
    );
  }
}
