import 'package:get/get.dart';

class HomePageController extends GetxController {
  var tabIndex = 0.obs;

  void changetabindex(var index) {
    tabIndex.value = index;
  }
}
