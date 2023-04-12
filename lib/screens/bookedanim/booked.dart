import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDonePage extends StatelessWidget {
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var storename = args["storename"];
    var storeaddr = args["storeaddress"];
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                    height: 300.h,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Lottie.asset(
                                'assets/lottieefiles/bokked.json',
                                height: 180.h,
                                width: 180.w,
                                repeat: true)),
                        Container(
                          child: Text(
                            "Booking Succesful",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 330.h,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        child: Text(
                          "Please Visit Below Store To Avail Your Service",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                            color: Colors.teal[400],
                            child: Text(
                              "Store Name : ${storename.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            color: Colors.teal[400],
                            alignment: Alignment.center,
                            child: Text(
                              "Store Address : ${storeaddr.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 200.h,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width * 0.1, 60.h)),
                        onPressed: () {
                          Get.offAllNamed("/home");
                        },
                        child: Text(
                          "Go To HomePage",
                          style: TextStyle(
                            wordSpacing: 1,
                          ),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width * 0.1, 60.h)),
                        onPressed: () {
                          Get.offAndToNamed("/orderhistory");
                        },
                        child: Text(
                          "See Booked Orders",
                          style: TextStyle(
                            wordSpacing: 1,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
