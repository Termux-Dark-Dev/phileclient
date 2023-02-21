import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/login&signup/signupctrl.dart';

import 'login.dart';

class SignupPage extends StatelessWidget {
  SignupControl controller = Get.put(SignupControl());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: controller.signupformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Signup",
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
                    TextFormField(
                      controller: controller.usernamectrl,
                      validator: (value) =>
                          controller.userNameValidator(value!),
                      onSaved: (newValue) => controller.username = newValue!,
                      decoration: InputDecoration(
                        labelText: "Username",
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.phonecontroller,
                      validator: (value) => controller.phoneValidator(value!),
                      onSaved: (newValue) => controller.phone = newValue!,
                      decoration: InputDecoration(
                        labelText: "Phone No",
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
                    Text("we will send code on your email to confirm "),
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
                              onPrimary: Colors.yellow,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp))),
                          onPressed: () async {
                            await controller.signup();
                            controller.emailcontroller.clear();
                            controller.passcontroller.clear();
                            controller.phonecontroller.clear();
                            controller.usernamectrl.clear();
                          },
                        )),
                    SizedBox(
                      height: 200.h,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "old user ? ,",
                            style: TextStyle(
                                color: Colors.black, fontSize: 18.sp)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.offAllNamed('/login'),
                            text: "Login",
                            style: TextStyle(
                              fontSize: 20.sp,
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
