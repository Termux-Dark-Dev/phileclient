import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/controllers/profile/profilectrlr.dart';

class ProfilePage extends StatelessWidget {
  ProfilePageController controller = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: controller.getUserDetails(),
            builder: (ctx, snp) {
              if (snp.hasData) {
                if (snp.data != false) {
                  return SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 180.h,
                              width: size.width,
                              color: Colors.teal,
                              child: Center(
                                child: Text(
                                  "ChopChop",
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 4,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 55.sp),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 140.h,
                                child: CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 45.w,
                                  child: CircleAvatar(
                                      radius: 48.w,
                                      backgroundImage: AssetImage(
                                        'assets/chopchopicon.jpeg',
                                      )),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 120.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          height: 50.h,
                          width: size.width,
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                child: Card(
                                  elevation: 3,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.teal,
                                    size: 35.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 260.w,
                                child: Text(
                                  controller.usrname,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.sp,
                                      color: Colors.teal[800]),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              // Container(
                              //   width: 45.w,
                              //   child: Icon(
                              //     Icons.edit,
                              //     size: 30.sp,
                              //     color: Colors.teal,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                child: Card(
                                  elevation: 3,
                                  child: Icon(
                                    Icons.email_sharp,
                                    color: Colors.teal,
                                    size: 35.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 260.w,
                                child: Text(
                                  controller.email,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.sp,
                                      color: Colors.teal[800]),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 45.w,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.showEmailChangeDialog(),
                                  child: Icon(
                                    Icons.edit,
                                    size: 30.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                child: Card(
                                  elevation: 3,
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.teal,
                                    size: 35.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 260.w,
                                child: Text(
                                  controller.phone,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.sp,
                                      color: Colors.teal[800]),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 45.w,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.showNumberChangeDialog(),
                                  child: Icon(
                                    Icons.edit,
                                    size: 30.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                child: Card(
                                  elevation: 3,
                                  child: Icon(
                                    Icons.security,
                                    color: Colors.teal,
                                    size: 35.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 260.w,
                                child: Text(
                                  "Change Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.sp,
                                      color: Colors.teal[800]),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 45.w,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.showPassChangeDialog();
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    size: 30.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 196.h,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Change Account , ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.sp)),
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.Logout();
                                  },
                                text: " Logout?",
                                style: TextStyle(
                                    color: Colors.teal[800],
                                    decoration: TextDecoration.underline,
                                    fontSize: 20.sp)),
                          ]),
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Something Unexpected Ocuured",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
