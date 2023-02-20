import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/homepage/dashBoardctrl.dart';

class DateAndTimeSheet extends StatelessWidget {
  DashBoardController controller;

  DateAndTimeSheet({required this.controller});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height * 0.88,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              height: 100.h,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 10)));

                      if (selectedDate != null) {
                        controller.selectedDate.value =
                            selectedDate.toString().substring(0, 11);

                        // await controller.getAvailTime(controller.selectedstore,
                        //     controller.selectedDate.value);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 28.sp,
                      child: Icon(
                        size: 30.sp,
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Obx(() => Container(
                        width: 200.w,
                        height: 50.h,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            controller.selectedDate.toString(),
                            style: TextStyle(color: Colors.teal),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 100.h,
            ),
            // Container(
            //   height: 200.h,
            //   width: 400.w,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //       itemCount: controller.bookedtime.length,
            //       itemBuilder: (context, index) {
            //         if (controller.bookedtime.length == 0) {
            //           return Visibility(
            //               visible: false,
            //               child: SizedBox(
            //                 height: 1,
            //               ));
            //         }else{
            //           return Padding(padding: EdgeInsets.symmetric(horizontal: 10))
            //         }
            //       }),
            // ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              height: 50.h,
              width: 200.h,
              child: ElevatedButton(onPressed: () {}, child: Text("Continue")),
            )
          ],
        ),
      ),
    );
  }
}
