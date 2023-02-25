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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 160.h,
              width: size.width,
              child: Center(
                  child: Lottie.asset('assets/lottieefiles/bokked.json',
                      height: 200.h, width: 200.w)),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              child: Text(
                "Booking Succesful",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              child: Text(
                "Please Visit Below Store To Avail Your Service",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                " Name : ${storename.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.teal,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                "Address : ${storeaddr.toString()}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.teal,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 200.h,
              width: size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width * 0.7, 60.h)),
                      onPressed: () {
                        Get.offAllNamed("/home");
                      },
                      child: Text(
                        "Go Back To HomePage",
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
    );
  }
}
