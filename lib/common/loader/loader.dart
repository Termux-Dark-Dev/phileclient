import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Loader {
  static void showLoader(
      {required LottieBuilder animation, required String? title}) {
    Get.dialog(WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Title(
              color: Colors.white,
              child: Text(
                title!,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              )),
        ),
        content: Container(
          height: 100.h,
          width: 200.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black26, blurRadius: 2, offset: Offset(0, 2))
            // ]
          ),
          child: Center(
            child: animation,
          ),
        ),
      ),
    ));
  }

  static void hideLoader() {
    if (Get.isDialogOpen!) Get.back();
  }
}
