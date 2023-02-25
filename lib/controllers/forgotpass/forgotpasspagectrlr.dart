import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/services/forgotpass/forgotpass.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';

class ForgotPassPageController extends GetxController {
  GlobalKey<FormState> forgotinpassformkey = GlobalKey<FormState>();
  late String email, newpass1, newpass2;
  late TextEditingController pass1ctrlr, pass2ctrlr;
  var pass1isVisible = true.obs;
  var pass2isVisible = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pass1ctrlr = TextEditingController();
    pass2ctrlr = TextEditingController();
  }

  String? passValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,16}$');
    if (value!.isEmpty) {
      return "Please Enter Alphanumeric Password Between 8 to 16";
    } else {
      if (!regex.hasMatch(value)) {
        return "Please Enter Alphanumeric Password Between 8 to 16";
      } else {
        return null;
      }
    }
  }

  Future upDatePass() async {
    if (forgotinpassformkey.currentState!.validate()) {
      forgotinpassformkey.currentState!.save();
      if (newpass1 == newpass2) {
        ForgotPassService obj = ForgotPassService();
        Loader.showLoader(
            animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
            title: "Please Wait");
        var res = await obj.chnagePass(email, newpass1);
        Loader.hideLoader();
        if (res == true) {
          Future.delayed(Duration(seconds: 0), () {
            SnackBars.customsnack(
                "Password Changed Successfully", Icons.done, Colors.teal);
          }).whenComplete(() => Get.offAllNamed("/login"));
        } else {
          SnackBars.customsnack(
              "Something Unexpected Occured", Icons.close, Colors.red);
        }
      } else {
        SnackBars.customsnack(
            "Password Don't Match", Icons.close, Colors.red[800]!);
      }
    }
  }
}
