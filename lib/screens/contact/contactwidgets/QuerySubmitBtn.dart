import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:phileclientapp/controllers/profile/profilectrlr.dart';

class QuerySubmitButton extends StatelessWidget {
  late ProfilePageController controller;
  QuerySubmitButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text(
          'Submit',
          style: TextStyle(
              color: Colors.white, fontFamily: "Roboto", fontSize: 20.sp),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.teal, minimumSize: Size(200.w, 40.h)),
        onPressed: () async {
          // await controller.handleQuery();
          var query = controller.queryctrlr.text;
          if (query.length > 50) {
            controller.queryctrlr.clear();
            var res = await controller.sendQuery(query);
            if (res == true) {
              Get.back();
              SnackBars.customsnack(
                  "We Got Your Query We Will Try To Reach Out You Soon",
                  Icons.done,
                  Colors.teal);
            } else {
              SnackBars.customsnack(
                  "Something Unexpected Occured Please Try Again",
                  Icons.refresh,
                  Colors.red);
            }
          } else {
            SnackBars.customsnack("Query Should Be Of Minimum 50 Characters",
                Icons.close, Colors.red);
          }
        },
      ),
    );
  }
}
