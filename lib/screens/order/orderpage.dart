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
        title: Text("Your Order"),
      ),
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
                    "Getting Your Booked Order",
                    style: TextStyle(color: Colors.black, fontSize: 25.sp),
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
  late String date, serviceopted, shopname, orderdate, srvctime;
  MyOrders(
      {required this.date,
      required this.orderdate,
      required this.shopname,
      required this.serviceopted,
      required this.srvctime});
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
          Text(
            "Ordered On: $orderdate",
            style: TextStyle(fontWeight: FontWeight.w200),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150.h,
                          width: 120.w,
                          color: Colors.teal,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC-qHziJmOHAuee-hMNj8FoQKSrk3a3_xFiA&usqp=CAU",
                            fit: BoxFit.fill,
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
                                    "Shop Name : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ),
                                  Text(
                                    "$shopname",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
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
                                      "Service date : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      "$date",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
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
                                      "Service time : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      "$srvctime",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
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
                              width: 350.w, //
                              child: Text(
                                "Service Asked : $serviceopted",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                                maxLines: 4,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        )
                      ],
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
                        VerticalDivider(width: 60.w),
                        Text(
                          'Hope you enjoyed the Service!',
                          style: TextStyle(color: Color(0xff666666)),
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
