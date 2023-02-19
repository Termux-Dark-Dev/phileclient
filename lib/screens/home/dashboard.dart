import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/homepage/dashBoardctrl.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Vishal",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),

                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundColor: Colors.teal,
                  //   foregroundImage: NetworkImage(
                  //       "https://img.icons8.com/material-two-tone/256/search.png"),
                  // )
                  Expanded(
                    child: AnimSearchBar(
                      rtl: true,
                      width: size.width * 0.95,
                      textController: controller.searchctrl,
                      onSuffixTap: () {},
                      onSubmitted: (value) {},
                      helpText: "Search For Your Fav Stores",
                      color: Colors.teal,
                      searchIconColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 40.h,
              width: size.width,
              child: Text("Search the service you want",
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
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                        child: Card(
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 8,
                                        top: 5.0,
                                        bottom: 5.0,
                                        right: 8),
                                    height: 200.0,
                                    width: MediaQuery.of(context).size.width *
                                        0.83,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC-qHziJmOHAuee-hMNj8FoQKSrk3a3_xFiA&usqp=CAU'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          "StoreName",
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
                                    margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text('Addr : Test adrress'),
                                    ),
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 5.0, top: 5),
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
                                          // var storeid =
                                          //     controller.listofstores[index].id;
                                          // Get.toNamed("/booktimeslot",
                                          //     arguments: {
                                          //       "userid": controller.usrid,
                                          //       "storeid": storeid
                                          //     });
                                        },
                                        icon: Icon(Icons.ads_click),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        label: Text("Book Now"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );

                      // return Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 10.h),
                      //     child: Card(
                      //       elevation: 8,
                      //       shadowColor: Colors.black,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //       child: SingleChildScrollView(
                      //         scrollDirection: Axis.horizontal,
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.all(
                      //                       Radius.circular(4)),
                      //                   color: Colors.amber,
                      //                   image: DecorationImage(
                      //                       image: NetworkImage(
                      //                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC-qHziJmOHAuee-hMNj8FoQKSrk3a3_xFiA&usqp=CAU'),
                      //                       fit: BoxFit.cover)),
                      //               height: 280.h,
                      //               width: size.width * 0.60,
                      //             ),
                      //             Container(
                      //               padding: EdgeInsets.only(left: 15.w),
                      //               height: 280.h,
                      //               width: size.width * 0.50,
                      //               decoration: BoxDecoration(
                      //                   // color: Colors.blue,
                      //                   borderRadius: BorderRadius.all(
                      //                       Radius.circular(10))),
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Text(
                      //                     "Name : Black Ranges Of Stores And Co. ",
                      //                     maxLines: 5,
                      //                     style: TextStyle(
                      //                         color: Colors.black54,
                      //                         fontSize: 18,
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 20.h,
                      //                   ),
                      //                   Text(
                      //                     "Address : this is a test address of a store owned by black ranges of stores inn the world  ",
                      //                     maxLines: 5,
                      //                     style: TextStyle(
                      //                         color: Colors.black54,
                      //                         fontSize: 18,
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 20.h,
                      //                   ),
                      //                   ElevatedButton(
                      //                     onPressed: () {},
                      //                     child: Text("Book Now"),
                      //                     style: ElevatedButton.styleFrom(
                      //                         primary: Colors.teal),
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
