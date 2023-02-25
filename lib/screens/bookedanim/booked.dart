import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: 25.w, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            // Container(
            //   height: 110.w,
            //   child: Text(" Details of Service boooked"),
            // ),
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
