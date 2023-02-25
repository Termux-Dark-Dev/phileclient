import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/forgotpass/forgotpasspagectrlr.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPageController controller = Get.put(ForgotPassPageController());
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.email = args["useremail"];
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: controller.forgotinpassformkey,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Text(
                    "Enter Your New Password",
                    style: TextStyle(fontSize: 25.sp, color: Colors.teal),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => TextFormField(
                      obscureText: controller.pass1isVisible.value,
                      controller: controller.pass1ctrlr,
                      validator: (value) => controller.passValidator(value),
                      onSaved: (newValue) => controller.newpass1 = newValue!,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(controller.pass1isVisible.value == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.pass1isVisible.value =
                                !controller.pass1isVisible.value;
                          },
                        ),
                        labelText: "New Password",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 60.h,
                ),
                Obx(() => TextFormField(
                      obscureText: controller.pass2isVisible.value,
                      controller: controller.pass2ctrlr,
                      validator: (value) => controller.passValidator(value),
                      onSaved: (newValue) => controller.newpass2 = newValue!,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(controller.pass2isVisible.value == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.pass2isVisible.value =
                                !controller.pass2isVisible.value;
                          },
                        ),
                        labelText: "Re-Enter Password",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 60.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(250.w, 50.h)),
                    onPressed: () async {
                      await controller.upDatePass();
                    },
                    child: Text(
                      "Change",
                      style: TextStyle(color: Colors.white, fontSize: 25.sp),
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
