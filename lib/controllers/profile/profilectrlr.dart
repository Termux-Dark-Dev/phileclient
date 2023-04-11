import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';
import 'package:phileclientapp/services/loginandsignup/sendotpsrvc.dart';
import 'package:phileclientapp/services/query/querysrvc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/updates/passupdateservc.dart';

class ProfilePageController extends GetxController {
  late String phone, email, usrname, id;
  TextEditingController currpassctrlr = TextEditingController();
  TextEditingController newpassctrlr = TextEditingController();
  TextEditingController phonenumctrlr = TextEditingController();
  TextEditingController emailctrlr = TextEditingController();
  TextEditingController queryctrlr = TextEditingController();
  Future getUserDetails() async {
    SARServices obj = SARServices();
    var userdetails = await obj.getUserDetails();
    if (userdetails != null) {
      usrname = userdetails["username"];
      phone = userdetails["phone"];
      email = userdetails["email"];
      id = userdetails["id"];

      // var x = usrname;
      // var s = "";
      // for (var i in x.split(" ")) {
      //   var z = i.trim();
      //   if (z.length > 1) {
      //     s = s + z + " ";
      //   }
      // }
      // usrname = s;
      return true;
    } else {
      return false;
    }
  }

  void Logout() async {
    SARServices obj = SARServices();
    var res = await obj.logoutUser();
    if (res == true) {
      Get.offAllNamed("/login");
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

  String? phoneValidator(String value) {
    var pattern = r'^[6789]\d{9}$';
    var regex = RegExp(pattern);
    if (value.length == 10 && regex.hasMatch(value)) {
      return null;
    } else {
      return 'Please enter 10 digit mobile';
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
                        if (currpass == newpass) {
                          SnackBars.customsnack(
                              "Current And New Password Cannot Be Same",
                              Icons.close,
                              Colors.red);
                        } else {
                          var res = passChecker(newpass);
                          if (res == null) {
                            // todo update pass

                            await updatePass(currpass, newpass);
                          } else {
                            currpassctrlr.clear();
                            newpassctrlr.clear();
                            SnackBars.customsnack(res, Icons.close, Colors.red);
                          }
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
                keyboardType: TextInputType.number,
                controller: phonenumctrlr,
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
                      onPressed: () async {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        var newphonenum = phonenumctrlr.text;
                        if (phone == newphonenum) {
                          SnackBars.customsnack("Same Mobile No. Entered",
                              Icons.close, Colors.red);
                        } else {
                          var isProper = phoneValidator(newphonenum);
                          if (isProper == null) {
                            phonenumctrlr.clear();
                            Get.back();

                            var isOtpSent = await sendOtpToNewMail(email);
                            if (isOtpSent) {
                              Get.toNamed('/phoneupdateotp', arguments: {
                                "phonenum": newphonenum,
                                "email": email
                              });
                            } else {
                              emailctrlr.clear();
                              Get.back();
                              SnackBars.customsnack(
                                  "Something Unexpected Occured",
                                  Icons.close,
                                  Colors.red);
                            }
                          } else {
                            phonenumctrlr.clear();
                            SnackBars.customsnack(
                                isProper, Icons.close, Colors.red);
                          }
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
                controller: emailctrlr,
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
                        emailctrlr.clear();
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                      label: Text(
                        "Cancel",
                      )),
                  ElevatedButton.icon(
                      onPressed: () async {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        var newemail = emailctrlr.text;
                        if (!GetUtils.isEmail(newemail)) {
                          SnackBars.customsnack(
                              "Enter Valid Email", Icons.close, Colors.red);
                        } else {
                          if (newemail == email) {
                            SnackBars.customsnack(
                                "Same Email Entered", Icons.close, Colors.red);
                          } else {
                            Get.back();
                            emailctrlr.clear();
                            var isOtpSent = await sendOtpToNewMail(newemail);
                            if (isOtpSent) {
                              Get.toNamed('/emailupdateotp', arguments: {
                                "userid": id,
                                "newemail": newemail
                              });
                            } else {
                              emailctrlr.clear();
                              Get.back();
                              SnackBars.customsnack(
                                  "Something Unexpected Occured",
                                  Icons.close,
                                  Colors.red);
                            }
                          }
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

  Future sendOtpToNewMail(String newmail) async {
    try {
      SendOtpService obj = SendOtpService();
      Loader.showLoader(
          animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
          title: "Sending Otp");
      var res = await obj.sendOTP(newmail);
      Loader.hideLoader();
      if (res == true) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      // TODO

      return false;
    }
  }

  void showContactInfo() {
    Get.dialog(AlertDialog(
        backgroundColor: Colors.teal,
        content: Container(
          height: 100.h,
          width: 300.w,
          color: Colors.teal,
          child: Center(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Please reach out to us at ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: "+918999523696",
                        );
                        if (!await launchUrl(launchUri)) {
                          SnackBars.customsnack(
                              "Something Unexpected Occured While Opening Phone Caller",
                              Icons.close,
                              Colors.red);
                        }
                      },
                    text: "8999523696",
                    style: TextStyle(
                        fontSize: 20.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: " or email us at ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri launchUri = Uri(
                            scheme: 'mailto',
                            path: "sagarvishal85@gmail.com",
                            query: encodeQueryParameters(<String, String>{
                              'subject': 'Regarding Query On ChopChop App',
                            }));
                        if (!await launchUrl(launchUri)) {
                          SnackBars.customsnack(
                              "Something Unexpected Occured While Opening Phone Caller",
                              Icons.close,
                              Colors.red);
                        }
                      },
                    text: " sagarvishal85@gmail.com ",
                    style: TextStyle(
                        fontSize: 20.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: " to get your query resolved",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ]),
            ),
          ),
        )));
  }

  Future showQueryDialog() async {
    Get.dialog(WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        content: Container(
          height: 280.h,
          width: 300.w,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Enter Your Query",
                style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60.h,
              ),
              TextFormField(
                controller: queryctrlr,
                decoration: InputDecoration(
                  labelText: "Query",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        queryctrlr.clear();
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                      label: Text(
                        "Cancel",
                      )),
                  ElevatedButton.icon(
                      onPressed: () async {
                        var query = queryctrlr.text;
                        if (query.length > 9) {
                          queryctrlr.clear();
                          var res = await sendQuery(query);
                          if (res == true) {
                            Get.back();
                            SnackBars.customsnack(
                                "We Got Your Query We Will Try To Reach Out You Soon",
                                Icons.done,
                                Colors.teal);
                          } else {
                            SnackBars.customsnack(
                                "Something Unexpected Occured Please Try Again",
                                Icons.refresh,
                                Colors.red);
                          }
                        } else {
                          SnackBars.customsnack(
                              "Query Should Be Of Minimum 10 Characters",
                              Icons.close,
                              Colors.red);
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

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future sendQuery(String query) async {
    QueryService obj = QueryService();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Submiting Your Query");
    var response = await obj.querySrvc(id, query);
    Loader.hideLoader();
    if (response == true) {
      return true;
    } else if (response == false) {
      return false;
    } else {
      return null;
    }
  }
}
