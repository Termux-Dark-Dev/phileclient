import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/order/orderctrlr.dart';

class OderHistoryPage extends StatelessWidget {
  OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal[600],
          title: Text("My Bookings"),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.getOrdersWithPopUp();
              },
              icon: Icon(Icons.refresh),
            ),
          ]),
      body: RefreshIndicator(
        onRefresh: controller.getOrdersWithPopUp,
        child: Container(
          child: Obx(() {
            if (controller.listoforder.length == 0) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lottieefiles/loading.json",
                      height: 200.h, width: 200.w),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Getting Your Appointments",
                    style: TextStyle(
                        color: Colors.teal[700],
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ));
            }
            if (controller.listoforder[0] == "Something Unexpected Occured" ||
                controller.listoforder[0] ==
                    "You Have Not Booked Any Services Yet" ||
                controller.listoforder[0] == "Internal Server Error") {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.listoforder[0].toString()),
                    SizedBox(
                      height: 40.h,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await controller.getOrdersWithPopUp();
                        },
                        child: Text("Refresh"))
                  ],
                ),
              );
            }

            return ListView.builder(
                itemCount: controller.listoforder.length,
                itemBuilder: (context, index) {
                  return MyOrders(
                    date: controller.listoforder[index].servicedate,
                    orderdate: controller.listoforder[index].orderdate,
                    shopname: controller.listoforder[index].storename,
                    serviceopted: controller.listoforder[index].servicesopted,
                    srvctime: controller.listoforder[index].servicetime,
                    address: controller.listoforder[index].address,
                    shopimage: controller.listoforder[index].shopimage,
                  );
                });
          }),
        ),
      ),
      backgroundColor: Color(0xFFf7f7f7),
    );
  }
}

class MyOrders extends StatelessWidget {
  ScrollController scrlctrl = ScrollController(initialScrollOffset: 1.w);
  late String date,
      serviceopted,
      shopname,
      orderdate,
      srvctime,
      address,
      shopimage;
  MyOrders({
    required this.date,
    required this.orderdate,
    required this.shopname,
    required this.serviceopted,
    required this.srvctime,
    required this.address,
    required this.shopimage,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Container(
            height: 20.h,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Booked On: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.teal[700]),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "$orderdate",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  RawScrollbar(
                    trackRadius: Radius.circular(15),
                    trackVisibility: true,
                    trackColor: Colors.grey[300],
                    thumbColor: Colors.teal[700],
                    thickness: 5.sp,
                    radius: Radius.circular(15),
                    thumbVisibility: true,
                    controller: scrlctrl,
                    child: SingleChildScrollView(
                      controller: scrlctrl,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 220.h,
                              width: 150.w,
                              color: Colors.white,
                              child: shopimage == ""
                                  ? Image.asset(
                                      "assets/storeimage.png",
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      shopimage,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/storeimage.png",
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Store Name        :",
                                        style: TextStyle(
                                            color: Colors.teal[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        "$shopname",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  height: 30.h,
                                  width: 265.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Service Time      :",
                                          style: TextStyle(
                                              color: Colors.teal[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          "$srvctime",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  height: 30.h,
                                  width: 265.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Service Date       :",
                                          style: TextStyle(
                                              color: Colors.teal[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          "$date",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                    width: 380.w, //

                                    child: Row(
                                      children: [
                                        Text(
                                          "Store Address    :",
                                          style: TextStyle(
                                              color: Colors.teal[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                          maxLines: 4,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "$address",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                    width: 380.w, //

                                    child: Row(
                                      children: [
                                        Text(
                                          "Services Opted  :",
                                          style: TextStyle(
                                              color: Colors.teal[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                          maxLines: 4,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "$serviceopted",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.h,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Booked",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(110.w, 35.h),
                              backgroundColor: Colors.teal),
                        ),
                        VerticalDivider(width: 40.w),
                        Text(
                          'Hope you enjoyed the Service!',
                          style: TextStyle(
                              color: Color(0xff666666), fontSize: 15.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
