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
      body: Obx(() {
        if (controller.listoforder.length == 0) {
          return Center(
              child: Lottie.asset('assets/lottieefiles/loading.json',
                  width: 60.w, height: 60.h));
        }
        if (controller.listoforder.length == 1) {
          return Center(
            child: Text(controller.listoforder[0].toString()),
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
              );
            });
      }),
      backgroundColor: Color(0xFFf7f7f7),
    );
  }
}

class MyOrders extends StatelessWidget {
  late String date, serviceopted, shopname, orderdate;
  MyOrders(
      {required this.date,
      required this.orderdate,
      required this.shopname,
      required this.serviceopted});
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
              height: 265.h,
              width: size.width * 0.95,
              color: Colors.white,
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150.h,
                        width: 100.w,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30.h,
                            width: 265.w,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
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
                            height: 65.h,
                            width: 265.w,
                            child: Text(
                              "Service Asked : $serviceopted",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      )
                    ],
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
