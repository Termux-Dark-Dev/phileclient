import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/loginandsignup/verifyotpservice.dart';

class ForgotPassOtpCtrlr extends GetxController {
  late String email, pin1, pin2, pin3, pin4, otp;
  final otpnewformkey = GlobalKey<FormState>();

  Future verifyOtp() async {
    if (otpnewformkey.currentState!.validate()) {
      otpnewformkey.currentState!.save();
      otp = pin1 + pin2 + pin3 + pin4;
      VerifyOTPService obj = VerifyOTPService();
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Please Wait Verifying ...");
      var res = await obj.verifyOTP(email, otp);
      Loader.hideLoader();
      if (res == true) {
        // it comes here if otp is successfully verified
        Get.offNamedUntil("/forgotpasspage", ModalRoute.withName("/login"),
            arguments: {"useremail": email});
      } else if (res == false) {
        // it comes here if otp is is expired

        Future.delayed(Duration(seconds: 0), () {
          SnackBars.customsnack("Otp Expired", Icons.close, Colors.red[800]!);
        }).whenComplete(() => Get.offAllNamed('/login'));
      } else if (res == "Otp Mismatch") {
        // it comes here if otp is mismatch

        SnackBars.customsnack("Otp Mismatch", Icons.close, Colors.red[800]!);
      } else if (res == null) {
        // it comes here if something happen on server side

        SnackBars.customsnack(
            "Something Unnexpected Occured", Icons.close, Colors.red[800]!);
      } else {
        // it comes here if something happen on client side

        SnackBars.customsnack(
            "Something Unnexpected Occured", Icons.close, Colors.red[800]!);
      }
    }
  }
}
