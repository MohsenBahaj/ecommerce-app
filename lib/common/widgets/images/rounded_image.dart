import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomm/common/widgets/shimmers/shimmer.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRaduis = true,
    this.border,
    this.bakcgroundColor = AppColors.light,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = AppSizes.md,
    this.overlayColor,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRaduis;
  final BoxBorder? border;
  final Color bakcgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    print("Building AppRoundedImage with imageUrl: $imageUrl");
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          color: bakcgroundColor, // Ensure a background color is set
        ),
        child: ClipRRect(
          borderRadius: applyImageRaduis
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: ClipRRect(
            borderRadius: applyImageRaduis
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder: (context, url, progress) =>
                        AppShimmerEffect(
                      width: width ?? 0,
                      height: height ?? 0,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    fit: fit,
                  ),
          ),
        ),
      ),
    );
  }
}
