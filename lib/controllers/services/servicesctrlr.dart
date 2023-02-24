import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';

import '../../common/loader/loader.dart';
import '../../services/bookorder/bookordersrvc.dart';

class ServicesController extends GetxController {
  late String storeid, userid, selectedtime, selecteddate;
  var servicesList = [
    {"serviceName": "Haircut", "icons": Icons.abc, "isSelected": false},
    {"serviceName": "Shaving", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Trimming", "icons": Icons.hive_sharp, "isSelected": false},
    {"serviceName": "Massage", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Hair Color", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Eyelashes", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Waxing", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Pedicure", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Manicure", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Waxing", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Combing", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Makeup", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Threading", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Makeover", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Cosmetics", "icons": Icons.face, "isSelected": false},
    {"serviceName": "Bleach", "icons": Icons.face, "isSelected": false},
  ];
  var changed = false.obs;
  var isOK = false.obs;

  List bookServices() {
    var bookedserviceslist = [];
    for (var i in servicesList) {
      if (i["isSelected"] == true) {
        bookedserviceslist.add(i["serviceName"]);
      }
    }

    return bookedserviceslist;
  }

  Future bookService(List bookedlistservice) async {
    BookOrderService obj = BookOrderService();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Booking Your Special Order");

    var res = await obj.bookService(
        bookedlistservice, selectedtime, selecteddate, userid, storeid);
    Loader.hideLoader();

    if (res == true) {
      Future.delayed(Duration(seconds: 0), () {
        SnackBars.customsnack("Ordered Successfully", Icons.done, Colors.teal);
      }).whenComplete(() => Get.offAndToNamed('/home'));
    } else {
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red);
    }
  }
}
