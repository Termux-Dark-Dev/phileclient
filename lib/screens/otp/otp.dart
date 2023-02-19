import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/controllers/otp/otpctrl.dart';

class OTPPAGE extends StatelessWidget {
  OTPController controller = Get.put(OTPController());
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var email = args["email"];
    controller.useremail = args["email"];
    controller.password = args["password"];
    controller.phonenum = args["phone"];
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
              Text(
                  'Enter OTP You Recieved On Your Email ${email.toString().substring(0, 4) + "******" + email.toString().substring(email.toString().length - 3, email.toString().length)}'),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 400.w,
                height: 40.h,
                child: Form(
                  key: controller.formkey,
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
                        await controller.verifyOtp();
                      },
                      child: Text('Continue')))
            ],
          ),
        ),
      ),
    );
  }
}
