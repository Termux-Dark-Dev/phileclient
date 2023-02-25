import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';

import '../../common/loader/loader.dart';
import '../../services/bookorder/bookordersrvc.dart';

class ServicesController extends GetxController {
  late String storeid, userid, selectedtime, selecteddate;
  var servicesList = [
    {
      "serviceName": "Haircut",
      "icons": 'assets/icon/haircut.png',
      "isSelected": false
    },
    {
      "serviceName": "Shaving",
      "icons": 'assets/icon/shaving.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Trimming",
      "icons": 'assets/icon/trimming.png',
      "isSelected": false
    },
    {
      "serviceName": "Massage",
      "icons": 'assets/icon/massage.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Hair Color",
      "icons": 'assets/icon/haircolor.png',
      "isSelected": false
    },
    {
      "serviceName": "Eyelashes",
      "icons": 'assets/icon/eyelashes.png',
      "isSelected": false
    },
    {
      "serviceName": "Waxing",
      "icons": 'assets/icon/waxing.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Pedicure",
      "icons": 'assets/icon/pedicure.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Manicure",
      "icons": 'assets/icon/manicure.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Combing",
      "icons": 'assets/icon/combing.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Makeup",
      "icons": 'assets/icon/makeup.png',
      "isSelected": false
    },
    {
      "serviceName": "Threading",
      "icons": 'assets/icon/threading.png',
      "isSelected": false
    },
    {
      "serviceName": "Makeover",
      "icons": 'assets/icon/makeover.png',
      "isSelected": false
    },
    {
      "serviceName": "Cosmetics",
      "icons": 'assets/icon/cosmetics.png',
      "isSelected": false
    },
    {
      "serviceName": "Bleach",
      "icons": 'assets/icon/bleach.jpg',
      "isSelected": false
    },
    {
      "serviceName": "Others",
      "icons": 'assets/icon/bleach.jpg',
      "isSelected": false
    },
  ];
  var changed = false.obs;
  var isOK = false.obs;
  late String storename, storeaddress;

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
      // Future.delayed(Duration(seconds: 0), () {
      //   SnackBars.customsnack("Ordered Successfully", Icons.done, Colors.teal);
      // }).whenComplete(() => Get.offAllNamed('/home'));
      Get.close(2);
      Get.toNamed('/orderdone',
          arguments: {"storename": storename, "storeaddress": storeaddress});
    } else {
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red);
    }
  }
}
