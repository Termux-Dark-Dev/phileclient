import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/controllers/otp/emailupdateotpctrlr.dart';

class EmailUpdateOTP extends StatelessWidget {
  EmailUpdateOTPCtrl controller = Get.put(EmailUpdateOTPCtrl());
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.id = args["userid"];
    controller.newemail = args["newemail"];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 350.h,
                width: 400.w,
                child: LottieBuilder.asset(
                  'assets/lottieefiles/otpverify.json',
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  'Enter OTP You Received On Your Email ${controller.newemail.toString().substring(0, 4) + "******" + controller.newemail.toString().substring(controller.newemail.toString().length - 3, controller.newemail.toString().length)}',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 400.w,
                height: 40.h,
                child: Form(
                  key: controller.newformkey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                        width: 50.w,
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Otp";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            controller.pin1 = newValue!;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.black26))),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 50.w,
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Otp";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            controller.pin2 = newValue!;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.black26))),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 50.w,
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Otp";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            controller.pin3 = newValue!;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.black26))),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 50.w,
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).unfocus();
                            } else if (value.length == 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Otp";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            controller.pin4 = newValue!;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.black26))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                  height: 40.h,
                  width: 300.w,
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller.verifyOtpAndUpdateEmail();
                      },
                      child: Text('Continue')))
            ],
          ),
        ),
      ),
    );
  }
}
