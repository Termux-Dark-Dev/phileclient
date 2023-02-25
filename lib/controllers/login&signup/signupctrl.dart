import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/services/loginandsignup/sendotpsrvc.dart';

class SignupControl extends GetxController {
  var ispassHidden = true.obs;
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  late String email, password, phone, username;
  late TextEditingController emailcontroller,
      passcontroller,
      phonecontroller,
      usernamectrl;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    usernamectrl = TextEditingController();
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
    emailcontroller.dispose();
    passcontroller.dispose();
    phonecontroller.dispose();
  }

  String? emailValidator(String? value) {
    if (GetUtils.isEmail(value!)) {
      return null;
    } else {
      return "Please Enter Valid Email Id";
    }
  }

  String? passValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,16}$');
    if (value!.isEmpty) {
      return "Please Enter Alphanumeric Password Between 8 - 16";
    } else {
      if (!regex.hasMatch(value)) {
        return "Please Enter Alphanumeric Password Between 8 - 16";
      } else {
        return null;
      }
    }
  }

  String? phoneValidator(String value) {
    var pattern = r'^[6789]\d{9}$';
    var regex = RegExp(pattern);
    if (value.length == 10 && regex.hasMatch(value)) {
      return null;
    } else {
      return 'Please enter 10 digit mobile';
    }
  }

  String? userNameValidator(String value) {
    if (value.length > 2 && value.length < 21) {
      return null;
    } else {
      return "Please Enter Name Between 3 - 20 Characters";
    }
  }

  Future signup() async {
    bool isValid = signupformkey.currentState!.validate();
    if (isValid) {
      signupformkey.currentState!.save();
      SendOtpService obj = SendOtpService();
      emailcontroller.clear();
      passcontroller.clear();
      phonecontroller.clear();
      usernamectrl.clear();
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Sending OTP");
      var res = await obj.sendOTP(email);
      Loader.hideLoader();
      if (res == true) {
        Get.toNamed("/otp", arguments: {
          "email": email,
          "password": password,
          "phone": phone,
          "username": username
        });
      } else if (res == false) {
        SnackBars.customsnack(
            "Internal Server Error", Icons.close, Colors.red[800]!);
      } else {
        SnackBars.customsnack(
            "Something Unexpected Occured", Icons.close, Colors.red[800]!);
      }
    }
  }
}
