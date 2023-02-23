import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';

import '../../services/updates/passupdateservc.dart';

class ProfilePageController extends GetxController {
  late String phone, email, usrname, id;
  TextEditingController currpassctrlr = TextEditingController();
  TextEditingController newpassctrlr = TextEditingController();
  TextEditingController phonenumctrlr = TextEditingController();
  TextEditingController emailctrlr = TextEditingController();
  Future getUserDetails() async {
    SARServices obj = SARServices();
    var userdetails = await obj.getUserDetails();
    if (userdetails != null) {
      usrname = userdetails["username"];
      phone = userdetails["phone"];
      email = userdetails["email"];
      id = userdetails["id"];
      return true;
    } else {
      return false;
    }
  }

  void Logout() async {
    SARServices obj = SARServices();
    var res = await obj.logoutUser();
    if (res == true) {
      Get.offAndToNamed('/login');
    }
  }

  String? passChecker(String value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,16}$');
    if (value.isEmpty) {
      return "Enter password";
    } else {
      if (!regex.hasMatch(value)) {
        return "Please Enter Alphanumeric Password Between 8 to 16 characters";
      } else {
        return null;
      }
    }
  }

  void showPassChangeDialog() {
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
                "Please Enter Password",
                style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                controller: currpassctrlr,
                decoration: InputDecoration(
                  labelText: "Current Password",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                controller: newpassctrlr,
                decoration: InputDecoration(
                  labelText: "New Password",
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
                        currpassctrlr.clear();
                        newpassctrlr.clear();
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                      label: Text(
                        "Cancel",
                      )),
                  ElevatedButton.icon(
                      onPressed: () async {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        var currpass = currpassctrlr.text;
                        var newpass = newpassctrlr.text;
                        var res = passChecker(newpass);
                        if (res == null) {
                          // todo update pass

                          await updatePass(currpass, newpass);
                        } else {
                          currpassctrlr.clear();
                          newpassctrlr.clear();
                          SnackBars.customsnack(res, Icons.close, Colors.red);
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

  void showNumberChangeDialog() {
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
                "Please Enter New Number",
                style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                controller: currpassctrlr,
                // validator: (value) => controller.emailValidator(value),
                // onSaved: (newValue) => controller.email = newValue!,
                decoration: InputDecoration(
                  labelText: "New Phone Number",
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
                      onPressed: () {},
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

  void showEmailChangeDialog() {
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
                "Please Enter New Email",
                style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                controller: currpassctrlr,
                // validator: (value) => controller.emailValidator(value),
                // onSaved: (newValue) => controller.email = newValue!,
                decoration: InputDecoration(
                  labelText: "New Email",
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
                      onPressed: () {},
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

  Future updatePass(String currpass, String newpass) async {
    UpdatePassService obj = UpdatePassService();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Updating Your Password");
    var res = await obj.updateUserPass(email, currpass, newpass);
    Loader.hideLoader();
    if (res == true) {
      currpassctrlr.clear();
      newpassctrlr.clear();
      Get.back();
      SnackBars.customsnack(
          "Password Updated Successfully", Icons.done, Colors.teal);
    } else if (res == false) {
      currpassctrlr.clear();
      newpassctrlr.clear();
      Get.back();
      SnackBars.customsnack(
          "Current Password Dosent Match", Icons.close, Colors.red);
    } else {
      currpassctrlr.clear();
      newpassctrlr.clear();
      Get.back();
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red);
    }
  }
}
