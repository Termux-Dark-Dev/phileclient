import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phileclientapp/controllers/profile/profilectrlr.dart';

class RaiseQueryBox extends StatelessWidget {
  late ProfilePageController controller;
  RaiseQueryBox({required this.controller});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Raise Your Query :",
          style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: size.width,
          child: TextField(
            controller: controller.queryctrlr,
            maxLength: 500,
            maxLines: 7,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 40, horizontal: 15),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              labelText: 'Raise Query',
              labelStyle: TextStyle(color: Colors.black),
              hintText: 'Describe your Problem',
            ),
          ),
        ),
      ],
    );
  }
}
