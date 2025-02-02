import 'package:ecomm/common/widgets/loaders/app_loaders.dart';
import 'package:ecomm/data/repositories/categories/category_repositry.dart';
import 'package:ecomm/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final _categoryRepositry = Get.put(CategoryRepositry());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load categoyr data

  Future<void> fetchCategories() async {
    try {
      //show loader
      isLoading.value = true;

      // fetch categories
      final categories = await _categoryRepositry.getAllCategories();

      //update the categories lsit
      allCategories.assignAll(categories);
      // filter featud categories
      featuredCategories.assignAll(allCategories
          .where(
              (category) => category.isFeatured && category.parentId.isNotEmpty)
          .take(8)
          .toList());
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'oh Snaps', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // load selected category data

  //get category or sub-category
}
