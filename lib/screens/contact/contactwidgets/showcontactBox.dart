import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'showcontactboxwidgets/DetailConatiner.dart';
import 'showcontactboxwidgets/IconContainer.dart';

class ShowContactBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 20,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You can reach out to us directly at below details or raise a complaint by filling the form below",
              style: TextStyle(fontFamily: "Roboto", fontSize: 18.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            DetailContainerWidget(),
            IconContainer(),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
