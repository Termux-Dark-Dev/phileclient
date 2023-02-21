import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/screens/loginsignup/login.dart';
import 'package:phileclientapp/services/loginandsignup/loginservice.dart';

class LoginCtrl extends GetxController {
  var ispassHidden = true.obs;
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  late String email, password;
  late TextEditingController emailcontroller, passcontroller;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  String? emailValidator(String? value) {
    if (GetUtils.isEmail(value!)) {
      return null;
    } else {
      return "Enter Valid Email";
    }
  }

  String? passValidator(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return "Enter password";
    } else {
      if (!regex.hasMatch(value)) {
        return "Enter Valid Password";
      } else {
        return null;
      }
    }
  }

  Future login() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    bool isValid = loginformkey.currentState!.validate();
    if (isValid) {
      loginformkey.currentState!.save();
      LoginService obj = LoginService();
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Please Wait");
      var res = await obj.Login(email, password);
      Loader.hideLoader();
      if (res == true) {
        Future.delayed(Duration(seconds: 0), () {
          SnackBars.customsnack(
              "Login Successful", Icons.done, Colors.teal[800]!);
        }).whenComplete(() => Get.offAndToNamed("/home"));
      } else if (res == false) {
        SnackBars.customsnack(
            "Wrong Email Or Password", Icons.close, Colors.red[800]!);
      } else if (res == null) {
        SnackBars.customsnack(
            "Internal Server Error", Icons.close, Colors.red[800]!);
      } else {
        SnackBars.customsnack(
            "Something Unexpected Occured", Icons.close, Colors.red[800]!);
      }
    }
  }
}
