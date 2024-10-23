import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/common/widgets/products.cart/rating/rating_bar_indicator.dart';
import 'package:ecomm/features/shop/screens/product_reviews/widgets/rating_progress_indicator_and_rating.dart';
import 'package:ecomm/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Reiview & Ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and riviews are verifird and are from people who use the same type of device taht you use.'),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              //Overal Product Rating
              const OverallProductRating(),
              const AppRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              //user Riview List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
