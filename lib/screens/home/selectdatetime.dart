import 'dart:ui';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
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
    controller.storename = args["storename"];
    controller.storeaddr = args["addr"];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 300.h,
                  width: size.width,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC-qHziJmOHAuee-hMNj8FoQKSrk3a3_xFiA&usqp=CAU",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 100.h,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        controller.storename.toString(),
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Expanded(
                        child: Marquee(
                          text: controller.storeaddr.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.w),
                  height: 100.h,
                  width: size.width,
                  child: Text("Select Date Of Appointment",
                      style: TextStyle(fontSize: 20.sp)),
                ),
                Container(
                  height: 200.h,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            controller.isVisible.value = true;
                            await controller.getAvailTime(controller.store_id,
                                controller.date_selected.value);
                          }
                        },
                        child: Container(
                          height: 100.h,
                          width: 150.w,
                          padding: EdgeInsets.only(left: 10.w),
                          // color: Colors.black,
                          alignment: Alignment.center,
                          child: Stack(alignment: Alignment.center, children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal,
                              radius: 40.sp,
                              child: Icon(
                                size: 40.sp,
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                            Lottie.asset("assets/lottieefiles/click.json"),
                          ]),
                        ),
                      ),
                      Obx(() {
                        return Visibility(
                          visible: controller.isVisible.value,
                          child: Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.teal[400],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                width: 200.w,
                                height: 50.h,
                                child: Center(
                                  child: Text(
                                    controller.date_selected.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => Visibility(
                      visible: controller.isVisible.value,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 50.h,
                        width: size.width,
                        child: Text(
                          "Select Your Preffered Time Slot : ",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                    )),
                Container(
                  height: 500.h,
                  width: size.width,
                  // color: Colors.amber,
                  child: Obx(() {
                    print(controller.changedtiming.value);
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
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
                                  controller.btncolor.value = Colors.grey;
                                } else {
                                  controller.CheckandselectTime(index);
                                }
                                controller.changedtiming.value =
                                    !controller.changedtiming.value;
                              },
                              child: Container(
                                child: Center(
                                  child: Container(
                                    height: 50.h,
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
                                          : Colors.teal[800],
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
                                          DateFormat('h:mm a')
                                                  .format(
                                                      controller.timings[index]
                                                          ["date"] as DateTime)
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
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          DateFormat('h:mm a')
                                              .format(controller.timings[index]
                                                  ["date"] as DateTime)
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
                        color: Colors.white,
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
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 0,
                                  mainAxisExtent: 90),
                          itemBuilder: (context, index) {
                            return Obx(() {
                              print(controller.changedtiming.value);
                              return InkWell(
                                onTap: () {
                                  if (controller.bookedtime.contains(
                                      DateFormat('h:mm a').format(
                                          controller.timings[index]["date"]
                                              as DateTime))) {
                                  } else {
                                    if (controller.timings[index]
                                            ["isselected"] ==
                                        true) {
                                      controller.timings[index]["isselected"] =
                                          false;
                                      controller.time_selected = "";
                                      controller.btncolor.value = Colors.grey;
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
                                      height: 50.h,
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
                                                DateFormat('h:mm a').format(
                                                    controller.timings[index]
                                                        ["date"] as DateTime))
                                            ? Colors.grey
                                            : controller.timings[index]
                                                        ["isselected"] ==
                                                    false
                                                ? Colors.teal
                                                : Colors.teal[800],
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
                                            DateFormat('h:mm a')
                                                    .format(controller
                                                            .timings[index]
                                                        ["date"] as DateTime)
                                                    .toString()
                                                    .contains("AM")
                                                ? Icons.sunny
                                                : int.parse(DateFormat('h:mm a')
                                                            .format(controller
                                                                        .timings[
                                                                    index]["date"]
                                                                as DateTime)
                                                            .toString()
                                                            .substring(0, 1)) >
                                                        6
                                                    ? Icons.nightlight
                                                    : Icons.sunny,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            DateFormat('h:mm a').format(
                                                controller.timings[index]
                                                    ["date"] as DateTime),
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
                      if (controller.btncolor.value != Colors.grey) {
                        print(controller.time_selected);
                        print(controller.date_selected);
                        Get.toNamed("/services", arguments: {
                          "storeid": controller.store_id,
                          "userid": controller.userid,
                          "selecteddate": controller.date_selected.value,
                          "selectedtime": controller.time_selected
                        });
                      }
                    },
                    child: Obx(() => Container(
                          height: 50.h,
                          width: size.width,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: controller.btncolor.value,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                          ),
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
