import 'package:get/get.dart';
import 'package:phileclientapp/controllers/order/orderctrlr.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';

class HomePageController extends GetxController {
  var tabIndex = 0.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  void changetabindex(var index) {
    tabIndex.value = index;
  }
}
