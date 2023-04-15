import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/profile/profilectrlr.dart';

import 'contactwidgets/QuerySubmitBtn.dart';
import 'contactwidgets/raisequerybox.dart';
import 'contactwidgets/showcontactBox.dart';

class ContactUsPage extends StatelessWidget {
  late ProfilePageController controller;
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var controller = args['controller'];
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 8.0.w,
            backgroundColor: Colors.teal,
            title: Text(
              "CONTACT US",
              style: TextStyle(
                fontSize: 20.w,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowContactBox(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Divider(
                    thickness: 4,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  RaiseQueryBox(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  QuerySubmitButton(
                    controller: controller,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
