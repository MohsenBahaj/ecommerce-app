import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/products.cart/cart/cart_menu_icon.dart';
import 'package:ecomm/features/personalization/controllers/user_controller.dart';
import 'package:ecomm/features/shop/screens/cart/cart.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Day for shopping'.tr,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Obx(
            () => Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.white),
            ),
          ),
        ],
      ),
      action: [
        CartCounterIcon(
          iconColor: Colors.white,
          onPressed: () {
            Get.to(() => const CartScreen());
          },
        )
      ],
    );
  }
}
