import 'package:ecomm/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:ecomm/common/widgets/shimmers/category_shimmer.dart';
import 'package:ecomm/features/shop/controllers/category_controller.dart';
import 'package:ecomm/features/shop/screens/sub_category/sub_category.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return Obx(() {
      if (categoryController.isLoading.value) return const CategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      } else {
        return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return AppVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () {
                    Get.to(() => SubCategoriesScreen());
                  },
                );
              }),
        );
      }
    });
  }
}
