import 'package:ecomm/common/widgets/loaders/app_loaders.dart';
import 'package:ecomm/data/repositories/categories/banners_repositry.dart';
import 'package:ecomm/data/repositories/categories/category_repositry.dart';
import 'package:ecomm/features/shop/models/banner_model.dart';
import 'package:ecomm/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();
  final isLoading = false.obs;

  final _bannersRepositry = Get.put(BannersRepositry());

  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //load categoyr data

  Future<void> fetchBanners() async {
    try {
      //show loader
      isLoading.value = true;

      // fetch categories
      final categories = await _bannersRepositry.getAllBanners();

      //update the categories lsit
      allBanners.assignAll(categories);
      // filter featud categories
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'oh Snaps', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // load selected category data

  //get category or sub-category
}
