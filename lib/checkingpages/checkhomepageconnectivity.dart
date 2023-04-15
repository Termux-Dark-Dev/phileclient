import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/network/network.dart';
import 'package:phileclientapp/screens/home/homepage.dart';
import 'package:phileclientapp/screens/interneterrorpage/interneterrorpage.dart';

class CheckHomePageConnectivity extends StatelessWidget {
  NetworkController controller = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.connectionStatus == 0) {
        return InternetErrorPage();
      } else {
        return HomePage();
      }
    });
  }
}
