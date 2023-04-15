import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/screens/loginsignup/login.dart';
import 'package:phileclientapp/services/forgotpass/forgotchckrpasssrvc.dart';
import 'package:phileclientapp/services/loginandsignup/loginservice.dart';
import 'package:phileclientapp/services/loginandsignup/sendotpsrvc.dart';

class LoginCtrl extends GetxController {
  var isloginbtntapped = false.obs;
  var ispassHidden = true.obs;
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  late String email, password;
  late TextEditingController emailcontroller,
      passcontroller,
      forgotpassemailctrlr;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
    forgotpassemailctrlr = TextEditingController();
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
      return "Please Enter Valid Email";
    }
  }

  String? passValidator(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,16}$');
    if (value!.isEmpty) {
      return "Please Enter Valid Alphanumeric Password Between 8 - 16";
    } else {
      if (!regex.hasMatch(value)) {
        return "Please Enter Valid Alphanumeric Password Between 8 - 16";
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
        emailcontroller.clear();
        passcontroller.clear();
        Future.delayed(Duration(seconds: 0), () {
          SnackBars.customsnack(
              "Login Successful", Icons.done, Colors.teal[800]!);
        }).whenComplete(() {
          // Get.offAllNamed("/home");
          Get.offAllNamed("/chkhomepageconnectivity");
        });
      } else if (res == false) {
        isloginbtntapped.value = true;
        SnackBars.customsnack(
            "Wrong Email Or Password", Icons.close, Colors.red[800]!);
        Future.delayed(Duration(seconds: 4))
            .whenComplete(() => isloginbtntapped.value = false);
      } else if (res == null) {
        isloginbtntapped.value = true;
        SnackBars.customsnack(
            "Internal Server Error", Icons.close, Colors.red[800]!);
        Future.delayed(Duration(seconds: 4))
            .whenComplete(() => isloginbtntapped.value = false);
      } else {
        isloginbtntapped.value = true;
        SnackBars.customsnack(
            "Something Unexpected Occured", Icons.close, Colors.red[800]!);
        Future.delayed(Duration(seconds: 4))
            .whenComplete(() => isloginbtntapped.value = false);
      }
    }
  }

  void showForgotPassDialog() {
    Get.dialog(WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        content: Container(
          height: 280.h,
          width: 300.w,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Please Enter Email",
                style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                controller: forgotpassemailctrlr,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                      label: Text(
                        "Cancel",
                      )),
                  ElevatedButton.icon(
                      onPressed: () async {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        var newmail = forgotpassemailctrlr.text;
                        var res = emailValidator(newmail);
                        if (res == null) {
                          var result =
                              await checkUserExistsToForgotPass(newmail);
                          if (result == true) {
                            forgotpassemailctrlr.clear();
                            Get.back();
                            Get.toNamed("/forgotpassotp",
                                arguments: {"useremail": newmail});
                          } else if (result == false) {
                            forgotpassemailctrlr.clear();
                            SnackBars.customsnack(
                                "User Not Exists", Icons.close, Colors.red);
                          } else {
                            forgotpassemailctrlr.clear();
                            SnackBars.customsnack(
                                "Something Unexpected Occured",
                                Icons.close,
                                Colors.red);
                          }
                        } else {
                          SnackBars.customsnack("Please Enter Valid Mail",
                              Icons.close, Colors.red);
                        }
                      },
                      icon: Icon(Icons.send),
                      label: Text("Submit")),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future checkUserExistsToForgotPass(String newmail) async {
    Forgotpasscheckerservice obj = Forgotpasscheckerservice();
    SendOtpService obj1 = SendOtpService();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Please Wait Verifying You..");
    var res = await obj.checkEmailForForgotPass(newmail);
    Loader.hideLoader();
    if (res == true) {
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Sending Email ...");
      var res1 = await obj1.sendOTP(newmail);
      Loader.hideLoader();
      if (res1 == true) {
        return true;
      } else {
        return null;
      }
    } else if (res == false) {
      return false;
    } else {
      Loader.hideLoader();
      return null;
    }
  }
}
