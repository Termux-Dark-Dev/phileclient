import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:phileclientapp/controllers/homepage/dashBoardctrl.dart';
import 'package:phileclientapp/screens/home/dashboardcomponent/dateandtimesheet.dart';

class DashBoard extends GetView {
  DashBoardController controller = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 80.h,
              width: size.width,
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                      future: controller.sobj.getUserName(),
                      builder: (ctx, snp) {
                        if (snp.hasData) {
                          var x = snp.data as String;
                          var username = "";
                          for (var i in x.split(" ")) {
                            var z = i.trim();
                            if (z.length > 1) {
                              username = username + i;
                              break;
                            }
                          }
                          return Text(
                            "Hello, $username",
                            style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),

                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundColor: Colors.teal,
                  //   foregroundImage: NetworkImage(
                  //       "https://img.icons8.com/material-two-tone/256/search.png"),
                  // )
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CircleAvatar(
                      radius: 30.sp,
                      foregroundImage: AssetImage('assets/looksicon.png'),
                    ),
                  ),

                  //search bar
                  // Expanded(
                  //   child: AnimSearchBar(
                  //     rtl: true,
                  //     width: size.width * 0.95,
                  //     textController: controller.searchctrl,
                  //     onSuffixTap: () {},
                  //     onSubmitted: (value) {},
                  //     helpText: "Please select the store for booking",
                  //     color: Colors.teal,
                  //     searchIconColor: Colors.white,
                  //   ),
                  // )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 40.h,
              width: size.width,
              child: Text("Please select the store for booking",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: 5.h,
            ),
            // Container(
            //   height: 200.h,
            //   width: size.width,
            //   padding: EdgeInsets.only(left: 20.w, right: 20.w),
            //   // color: Colors.black,
            //   child: Center(
            //     child: Card(
            //       elevation: 5,
            //       child: Container(
            //         height: 180.h,
            //         width: size.width * 0.87,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Obx(() {
                    if (controller.listofstores.length == 0) {
                      return Center(
                        child: Container(
                          width: size.width * 0.7,
                          height: 300.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Lottie.asset('assets/lottieefiles/loading.json',
                                  width: 150.w, height: 150.h),
                              Text(
                                "Searching Stores Near You",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              )
                            ],
                          ),
                        ),
                      );
                    }

                    if (controller.listofstores[0] ==
                        "We are currently not serviceable in your area , We will be live very soon. Please expect a notification/message from us") {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.listofstores[0].toString()),
                          ],
                        ),
                      );
                    }

                    if (controller.listofstores.length == 1) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(controller.listofstores[0].toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await controller.getStoreDataWithPopUP(
                                      controller.latitude,
                                      controller.longitude);
                                },
                                child: Text("Refresh"))
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                        itemCount: controller.listofstores.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 8.w),
                            child: GestureDetector(
                              onTap: () {
                                var storeid = controller.listofstores[index].id;
                                Get.toNamed("/booktimeslot", arguments: {
                                  "userid": controller.userid,
                                  "storeid": storeid,
                                  "storename":
                                      controller.listofstores[index].name,
                                  "addr":
                                      controller.listofstores[index].address,
                                  "shopimage":
                                      controller.listofstores[index].storeimage
                                });
                              },
                              child: Card(
                                elevation: 8,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 8,
                                              top: 5.0,
                                              bottom: 5.0,
                                              right: 8),
                                          height: 250.0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.83,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: controller.listofstores[index]
                                                      .storeimage ==
                                                  ""
                                              ? Image.asset(
                                                  "assets/storeimage.png",
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  controller.listofstores[index]
                                                      .storeimage,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    print(error);
                                                    return Image.asset(
                                                      "assets/storeimage.png",
                                                      fit: BoxFit.fill,
                                                    );
                                                  },
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 40.h,
                                            width: 100.w,
                                            child: Center(
                                              child: Text(
                                                controller
                                                    .listofstores[index].name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Container(
                                              width: 120.w,
                                              height: 50.h,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 62.w,
                                                    child: Text(
                                                      "Address:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.teal[900],
                                                          fontSize: 15.sp),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    child: Marquee(
                                                      text:
                                                          '${controller.listofstores[index].address}            ',
                                                    ),
                                                  ))
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: 5.0, top: 5),
                                          width: 130.0,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(9.0)),
                                          ),
                                          child: Center(
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                var storeid = controller
                                                    .listofstores[index].id;
                                                Get.toNamed("/booktimeslot",
                                                    arguments: {
                                                      "userid":
                                                          controller.userid,
                                                      "storeid": storeid,
                                                      "storename": controller
                                                          .listofstores[index]
                                                          .name,
                                                      "addr": controller
                                                          .listofstores[index]
                                                          .address
                                                    });
                                              },
                                              icon: Icon(Icons.ads_click),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green),
                                              label: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  })),
            )
          ],
        ),
      ),
    );
  }
}
