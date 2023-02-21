import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

class HomeController extends GetxController {
  var currentIndex = 0.obs;
}
