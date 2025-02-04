import 'package:ecomm/data/services/network_manager.dart';
import 'package:ecomm/features/shop/controllers/banner_controller.dart/banners_controller.dart';
import 'package:ecomm/features/shop/controllers/category_controller.dart';
import 'package:ecomm/features/shop/controllers/product/image_controller.dart';
import 'package:ecomm/features/shop/controllers/product/product_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(CategoryController());
    Get.put(BannersController());
    Get.put(ProductController());
    Get.put(ImageController());
  }
}
