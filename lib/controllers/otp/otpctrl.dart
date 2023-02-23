import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/services/loginandsignup/registerservc.dart';
import 'package:phileclientapp/services/loginandsignup/verifyotpservice.dart';

class OTPController extends GetxController {
  final formkey = GlobalKey<FormState>();
  late String pin1, pin2, pin3, pin4;
  late String? useremail, password, otp, phonenum, username;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future verifyOtp() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      otp = pin1 + pin2 + pin3 + pin4;
      VerifyOTPService obj = VerifyOTPService();
      RegisterService obj1 = RegisterService();
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Verifying And Registering You");
      var res = await obj.verifyOTP(useremail!, otp!);

      if (res == true) {
        var isAdded = await obj1.registeruser(
            useremail!, password!, phonenum!, username!);
        Loader.hideLoader();
        if (isAdded == true) {
          Future.delayed(Duration(seconds: 0), () {
            SnackBars.customsnack(
                "Registered Successfully", Icons.done, Colors.teal[800]!);
          }).whenComplete(() => Get.offAllNamed("/login"));
        } else if (isAdded == false) {
          SnackBars.customsnack(
              "Internal Server Error", Icons.close, Colors.red[800]!);
        } else if (isAdded == null) {
          Future.delayed(Duration(seconds: 0), () {
            SnackBars.customsnack(
                "User with same details exists", Icons.close, Colors.red);
          }).whenComplete(() => Get.offAllNamed("/signup"));
        } else {
          SnackBars.customsnack(
              "Something Unexpected Occured ", Icons.close, Colors.red[800]!);
        }
      } else if (res == false) {
        Loader.hideLoader();
        Future.delayed(Duration(seconds: 0), () {
          SnackBars.customsnack("Otp Expired", Icons.close, Colors.red[800]!);
        }).whenComplete(() => Get.toNamed('/signup'));
      } else if (res == "Otp Mismatch") {
        Loader.hideLoader();
        SnackBars.customsnack("Otp Mismatch", Icons.close, Colors.red[800]!);
      } else if (res == null) {
        Loader.hideLoader();
        SnackBars.customsnack(
            "Internal Server Error", Icons.close, Colors.red[800]!);
      } else {
        Loader.hideLoader();
        SnackBars.customsnack(
            "Something Unnexpected Occured", Icons.close, Colors.red[800]!);
      }
    }
  }
}
