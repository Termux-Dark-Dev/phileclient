import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SnackBars {
  static void customsnack(String msg, IconData uploadicon, Color colur) {
    Get.showSnackbar(GetSnackBar(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
      duration: Duration(seconds: 6),
      backgroundColor: colur,
      message: msg,
      margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      icon: Container(
        height: 20.h,
        width: 20.w,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white)),
        child: Center(
          child: Icon(
            size: 15,
            uploadicon,
            color: Colors.green[100],
          ),
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
    ));
  }
}
