import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  "Email :",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 280.w,
                    child: Text(
                      "looks@phile.in",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  "Phone No :",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 280.w,
                    child: Text(
                      "8999523696",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
