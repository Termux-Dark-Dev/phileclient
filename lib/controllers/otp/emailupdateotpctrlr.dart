import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';
import 'package:phileclientapp/services/updates/emailupdatesrvc.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/loginandsignup/verifyotpservice.dart';

class EmailUpdateOTPCtrl extends GetxController {
  late String id, newemail, pin1, pin2, pin3, pin4, otp;
  final newformkey = GlobalKey<FormState>();

  Future verifyOtpAndUpdateEmail() async {
    if (newformkey.currentState!.validate()) {
      newformkey.currentState!.save();
      otp = pin1 + pin2 + pin3 + pin4;
      VerifyOTPService obj = VerifyOTPService();
      UpdateEmailService obj1 = UpdateEmailService();
      SARServices obj2 = SARServices();
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Verifying And Updating Email");
      var res = await obj.verifyOTP(newemail, otp);
      if (res == true) {
        // it comes here if otp is successfully verified
        var isUpdated = await obj1.updateUserEmail(id, newemail);
        Loader.hideLoader();
        if (isUpdated) {
          // it comes here if email is successfully updated on server side
          var res1 = await obj2.upDateUserEmail(newemail);
          if (res1 == true) {
            Future.delayed(Duration(seconds: 0), () {
              SnackBars.customsnack(
                  "Updated Successfully", Icons.done, Colors.teal);
            }).whenComplete(() => Get.offAndToNamed("/profile"));
          } else {
            Future.delayed(Duration(seconds: 0), () {
              SnackBars.customsnack(
                  "Something Unexpected Occured", Icons.close, Colors.red);
            }).whenComplete(() => Get.offAndToNamed("/profile"));
          }
        } else {
          Future.delayed(Duration(seconds: 0), () {
            SnackBars.customsnack(
                "Something Unexpected Occured", Icons.close, Colors.red);
          }).whenComplete(() => Get.offAndToNamed("/profile"));
        }
      } else if (res == false) {
        // it comes here if otp is is expired
        Loader.hideLoader();
        Future.delayed(Duration(seconds: 0), () {
          SnackBars.customsnack("Otp Expired", Icons.close, Colors.red[800]!);
        }).whenComplete(() => Get.offAndToNamed('/profile'));
      } else if (res == "Otp Mismatch") {
        // it comes here if otp is mismatch
        Loader.hideLoader();
        SnackBars.customsnack("Otp Mismatch", Icons.close, Colors.red[800]!);
      } else if (res == null) {
        // it comes here if something happen on server side
        Loader.hideLoader();
        SnackBars.customsnack(
            "Internal Server Error", Icons.close, Colors.red[800]!);
      } else {
        // it comes here if something happen on client side
        Loader.hideLoader();
        SnackBars.customsnack(
            "Something Unnexpected Occured", Icons.close, Colors.red[800]!);
      }
    }
  }
}
