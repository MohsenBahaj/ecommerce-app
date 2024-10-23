import 'package:ecomm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecomm/common/widgets/products.cart/rating/rating_bar_indicator.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/image_string.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImageAsset.facebook),
                ),
                const SizedBox(
                  width: AppSizes.spaceBtwItem,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        Row(
          children: [
            const AppRatingBarIndicator(rating: 4.5),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Text(
              '01 Nov, 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem,
        ),
        const ReadMoreText(
          '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry.printing and typesetting industry. printing and typesetting industry.
''',
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem,
        ),
        CircularContainer(
          background: dark ? AppColors.darkGrey : AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mohsen Store',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '02 Nov, 2024',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                const SizedBox(
                  height: AppSizes.spaceBtwItem,
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
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBtwSections,
        )
      ],
    );
  }
}
