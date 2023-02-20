import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/dateandtimeselect/dateandtimectrl.dart';

class SelectDateAndTime extends StatelessWidget {
  DateAndTimeController controller = Get.put(DateAndTimeController());
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    controller.store_id = args["storeid"];
    controller.userid = args["userid"];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 200.h,
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
                          controller.date_selected.value =
                              selectedDate.toString().substring(0, 11);

                          await controller.getAvailTime(controller.store_id,
                              controller.date_selected.value);
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
                          color: Colors.teal,
                          child: Center(
                            child: Text(
                              controller.date_selected.toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 100.h,
                width: size.width,
                child: Text(
                  "Select Your Preffered Time Slot : ",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Container(
                height: 200.h,
                width: size.width,
                // color: Colors.amber,
                child: Obx(() {
                  if (controller.bookedtime.length == 0) {
                    return Visibility(
                        visible: false,
                        child: SizedBox(
                          height: 1,
                        ));
                  } else if (controller.bookedtime[0] == 1) {
                    // todo show all times
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.timings.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Container(
                                width: 130.w,
                                // color: Colors.red,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor: Colors.teal,
                                  ),
                                  onPressed: () {},
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        controller.timings[index]["date"]
                                                .toString()
                                                .contains("AM")
                                            ? Icons.sunny
                                            : int.parse(controller
                                                        .timings[index]["date"]
                                                        .toString()
                                                        .substring(0, 1)) >
                                                    6
                                                ? Icons.nightlight
                                                : Icons.sunny,
                                        color: Colors.white,
                                        size: 30.sp,
                                      ),
                                      Text(
                                          style: TextStyle(
                                              fontSize: 25.sp,
                                              color: Colors.white),
                                          controller.timings[index]["date"]
                                              .toString()),
                                    ],
                                  ),
                                )),
                          );
                        });
                  } else if (controller.bookedtime[0] == 2) {
                    // todo show error in fetching time
                    return Container(
                      height: 50,
                      width: 50,
                      color: Colors.teal,
                      child: Center(
                        child: Text(
                          "Something Unexpected Occured",
                          style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                        ),
                      ),
                    );
                  } else {
                    // show avail times and disable booked times
                    return Container(
                      height: 200.h,
                      width: size.width,
                      // color: Colors.teal,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.timings.length,
                          itemBuilder: (context, index) {
                            var color = controller.bookedtime
                                    .contains(controller.timings[index]["date"])
                                ? Colors.grey
                                : Colors.teal;
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Container(
                                  width: 130.h,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: color,
                                    ),
                                    onPressed: () {
                                      if (color == Colors.grey) {
                                      } else {}
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          controller.timings[index]["date"]
                                                  .toString()
                                                  .contains("AM")
                                              ? Icons.sunny
                                              : int.parse(controller
                                                          .timings[index]
                                                              ["date"]
                                                          .toString()
                                                          .substring(0, 1)) >
                                                      6
                                                  ? Icons.nightlight
                                                  : Icons.sunny,
                                          color: Colors.white,
                                          size: 30.sp,
                                        ),
                                        Text(
                                            style: TextStyle(
                                                fontSize: 25.sp,
                                                color: Colors.white),
                                            controller.timings[index]["date"]
                                                .toString()),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
