import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/login&signup/loginctrl.dart';

class Login extends StatelessWidget {
  LoginCtrl controller = Get.put(LoginCtrl());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: controller.loginformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: AutofillHints.addressCity),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormField(
                      controller: controller.emailcontroller,
                      validator: (value) => controller.emailValidator(value),
                      onSaved: (newValue) => controller.email = newValue!,
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
                      height: 40.h,
                    ),
                    Obx(() => TextFormField(
                          obscureText: controller.ispassHidden.value,
                          controller: controller.passcontroller,
                          validator: (value) => controller.passValidator(value),
                          onSaved: (newValue) =>
                              controller.password = newValue!,
                          decoration: InputDecoration(
                            suffixIcon: controller.ispassHidden.value
                                ? GestureDetector(
                                    onTap: () => controller.ispassHidden.value =
                                        !controller.ispassHidden.value,
                                    child: Icon(Icons.visibility_off))
                                : GestureDetector(
                                    onTap: () => controller.ispassHidden.value =
                                        !controller.ispassHidden.value,
                                    child: Icon(Icons.visibility)),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 50.h,
                            minWidth: MediaQuery.of(context).size.width * 0.90),
                        child: ElevatedButton(
                          child: Text(
                            "Continue",
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal[800],
                              onPrimary: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp))),
                          onPressed: () => controller.login(),
                        )),
                    Container(
                      height: 70.h,
                      width: size.width,
                      alignment: Alignment.centerRight,
                      child: RichText(
                          text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => controller.showForgotPassDialog(),
                              text: "Forgot Password?",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.teal[800],
                                decoration: TextDecoration.underline,
                              ))),
                    ),
                    SizedBox(
                      height: 250.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "New User ? , ",
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.offAllNamed('/signup'),
                            text: "Create Account",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.teal[800],
                              decoration: TextDecoration.underline,
                            )),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
