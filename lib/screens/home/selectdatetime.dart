import 'dart:ui';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';

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
        body: ExpandableBottomSheet(
          key: controller.key,
          background: Container(
            color: Colors.white,
            child: Column(
              children: [
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
                  height: 50.h,
                  width: size.width,
                  child: Text(
                    "Select Your Preffered Time Slot : ",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                Container(
                  height: 500.h,
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
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: controller.timings.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 90),
                        itemBuilder: (context, index) {
                          return Obx(() {
                            print(controller.changedtiming.value);
                            return GestureDetector(
                              onTap: () {
                                if (controller.timings[index]["isselected"] ==
                                    true) {
                                  controller.timings[index]["isselected"] =
                                      false;
                                  controller.time_selected = "";
                                } else {
                                  controller.CheckandselectTime(index);
                                }
                                controller.changedtiming.value =
                                    !controller.changedtiming.value;
                              },
                              child: Container(
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 18,
                                    ),
                                    decoration: BoxDecoration(
                                      color: controller.timings[index]
                                                  ["isselected"] ==
                                              false
                                          ? Colors.teal
                                          : Colors.tealAccent,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 223, 223, 223),
                                          blurRadius: 2,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Row(
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
                                        ),
                                        Text(
                                          controller.timings[index]["date"]
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      );
                    } else if (controller.bookedtime[0] == 2) {
                      // todo show error in fetching time
                      return Container(
                        height: 50,
                        width: 50,
                        color: Colors.teal,
                        child: Center(
                          child: Text(
                            "Something Unexpected Occured",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.grey),
                          ),
                        ),
                      );
                    } else {
                      // show avail times and disable booked times
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: controller.timings.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  mainAxisSpacing: 0,
                                  mainAxisExtent: 90),
                          itemBuilder: (context, index) {
                            return Obx(() {
                              print(controller.changedtiming.value);
                              return InkWell(
                                onTap: () {
                                  if (controller.bookedtime.contains(
                                      controller.timings[index]["date"])) {
                                  } else {
                                    if (controller.timings[index]
                                            ["isselected"] ==
                                        true) {
                                      controller.timings[index]["isselected"] =
                                          false;
                                      controller.time_selected = "";
                                    } else {
                                      controller.CheckandselectTime(index);
                                    }
                                    controller.changedtiming.value =
                                        !controller.changedtiming.value;
                                  }
                                },
                                child: Container(
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 5.h,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.h,
                                        horizontal: 18.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: controller.bookedtime.contains(
                                                controller.timings[index]
                                                    ["date"])
                                            ? Colors.grey
                                            : controller.timings[index]
                                                        ["isselected"] ==
                                                    false
                                                ? Colors.teal
                                                : Colors.tealAccent,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 223, 223, 223),
                                            blurRadius: 2,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Row(
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
                                          ),
                                          Text(
                                            controller.timings[index]["date"]
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          });
                    }
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.w,
                    right: 30.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      var res = controller.isTimeAndDateEmpty();
                      if (res) {
                        if (controller.expansionStatus ==
                            ExpansionStatus.contracted) {
                          controller.key.currentState!.expand();
                        }
                      } else {
                        SnackBars.customsnack("Select Both Time And Date",
                            Icons.close, Colors.red);
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: size.width,
                      color: Colors.teal,
                      child: Center(
                        child: Text(
                          "Continue",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          expandableContent: Container(
            color: Colors.grey,
            height: 500.h,
            width: size.width,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Selected Date is : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      Text(
                        controller.date_selected.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(
                            Icons.timelapse,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Selected Time is : ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                        Obx(() {
                          print(controller.changedtiming);
                          return Text(
                            controller.time_selected.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 275.h,
                  width: size.width,
                  // color: Colors.white,
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(250.w, 50.h),
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.teal, fontSize: 20.sp),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
