import 'package:ecomm/common/widgets/layouts/grid_layout.dart';
import 'package:ecomm/common/widgets/shimmers/shimmer.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppVerticalShimmer extends StatelessWidget {
  const AppVerticalShimmer({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppShimmerEffect(width: 180, height: 180),
              SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              AppShimmerEffect(width: 160, height: 15),
              SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),
              AppShimmerEffect(width: 110, height: 15),
            ],
          ),
        );
      },
    );
  }
}
