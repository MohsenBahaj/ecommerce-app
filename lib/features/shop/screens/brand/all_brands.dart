import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/brand/brandCard.dart';
import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/texts/head_section.dart';
import 'package:ecomm/features/shop/screens/brand/brand_products.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSectionHeading(title: 'All Brands'),
                SizedBox(
                  height: AppSizes.spaceBtwItem,
                ),
                GridLayout(
                    itemCount: 10,
                    mainAxisExtent: 70,
                    itemBuilder: (__, index) {
                      return BrandCard(
                        showBorder: true,
                        onTap: () {
                          Get.to(() {
                            return BrandProducts();
                          });
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
