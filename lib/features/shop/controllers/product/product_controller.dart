import 'package:ecomm/common/widgets/loaders/app_loaders.dart';
import 'package:ecomm/data/repositories/Products/product_repositry.dart';
import 'package:ecomm/features/shop/models/produc_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  final _productsRepositry = Get.put(ProductRepositry());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

  Future<void> fetchFeaturedProduct() async {
    try {
      //show loader
      isLoading.value = true;
      print("start calling");
      // fetch categories
      final categories = await _productsRepositry.getFeaturedProducts();
      print("end calling");
      //update the categories lsit
      featuredProducts.assignAll(categories);

      // filter featud categories
    } catch (e) {
      print("==> ${e.toString()}");
      AppLoaders.errorSnackbar(title: 'oh Snaps=', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0.0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return "$smallestPrice - \$$largestPrice";
      }
    }
  }

  String? claculateSalePercentage(double originlaPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    if (originlaPrice <= 0) {
      return null;
    }
    double percentage = ((originlaPrice - salePrice) / originlaPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}

enum ProductType { single, variable }
