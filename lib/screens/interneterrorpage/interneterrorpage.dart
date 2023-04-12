import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class InternetErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200.h,
            width: size.width,
            alignment: Alignment.center,
            child:
                LottieBuilder.asset("assets/lottieefiles/interneterror.json"),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
              height: 200.h,
              width: size.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "No Network",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.teal[800]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "You seem to have gone out of network coverage",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal[600]),
                  ),
                  Text("Please check your wifi setting or mobile data",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal[600])),
                  Text("connection",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal[600]))
                ],
              ))
        ],
      )),
    ));
  }
}
