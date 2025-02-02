import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<int> carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
