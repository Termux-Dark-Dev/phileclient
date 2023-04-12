import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/checkingpages/checkLoggedin.dart';
import 'package:phileclientapp/controllers/network/network.dart';
import 'package:phileclientapp/screens/interneterrorpage/interneterrorpage.dart';

class CheckConnectivityComponent extends StatelessWidget {
  NetworkController netctrl = Get.put(NetworkController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (netctrl.connectionStatus == 0) {
        return InternetErrorPage();
      } else {
        return CheckLoggedInWidget();
      }
    });
  }
}
