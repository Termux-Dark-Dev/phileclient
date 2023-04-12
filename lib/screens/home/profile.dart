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
                              decoration: BoxDecoration(color: Colors.teal),
                              height: 180.h,
                              width: size.width,
                              child: Center(
                                child: Text(
                                  "LOOKS",
                                  style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            offset:
                                                Offset.fromDirection(-70, 5))
                                      ],
                                      letterSpacing: 4,
                                      wordSpacing: 4,
                                      fontWeight: FontWeight.w800,
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
                                        'assets/looksicon.png',
                                      )),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 100.h,
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
                                    size: 30.sp,
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
                                      fontSize: 19.sp,
                                      color: Colors.black),
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
                          height: 20.h,
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
                                    size: 30.sp,
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
                                      fontSize: 19.sp,
                                      color: Colors.black),
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
                                    size: 25.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                                    size: 30.sp,
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
                                      fontSize: 19.sp,
                                      color: Colors.black),
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
                                    size: 25.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                                    size: 30.sp,
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
                                      fontSize: 19.sp,
                                      color: Colors.black),
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
                                    size: 25.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                                    Icons.contact_mail,
                                    color: Colors.teal,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 260.w,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.showContactInfo();
                                  },
                                  child: Text(
                                    "Contact Us",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.sp,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                                    Icons.question_answer,
                                    color: Colors.teal,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Container(
                                width: 260.w,
                                child: Text(
                                  "Raise A Query",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.sp,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                width: 45.w,
                                child: GestureDetector(
                                  onTap: () async {
                                    await controller.showQueryDialog();
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: 25.sp,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
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
                                    Icons.shopping_bag,
                                    color: Colors.teal,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/orderhistory");
                                },
                                child: Container(
                                  width: 260.w,
                                  child: Text(
                                    "My Bookings",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
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
