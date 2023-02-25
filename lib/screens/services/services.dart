import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/controllers/services/servicesctrlr.dart';

class ServicePage extends StatelessWidget {
  ServicesController controller = Get.put(ServicesController());
  var args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.storeid = args["storeid"];
    controller.userid = args["userid"];
    controller.selecteddate = args["selecteddate"];
    controller.selectedtime = args["selectedtime"];
    controller.storename = args["storename"];
    controller.storeaddress = args["storeaddress"];

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                child: Text(
                  "Please Select Services You Need",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700]),
                )),
            Expanded(
                child: GridView.builder(
                    itemCount: controller.servicesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      return Obx(
                        () {
                          print(controller.changed.value);

                          return ActionChip(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                side: BorderSide(width: 1)),
                            backgroundColor: controller.servicesList[index]
                                        ["isSelected"] ==
                                    true
                                ? Colors.teal
                                : Colors.teal[300],
                            avatar: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(controller
                                          .servicesList[index]["icons"]
                                          .toString()),
                                      fit: BoxFit.cover)),
                            ),
                            label: Text(
                              controller.servicesList[index]["serviceName"]
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors
                                      .white //controller.servicesList[index]["isSelected"] ==true? Colors.white: Colors.white
                                  ),
                            ),
                            onPressed: () {
                              if (controller.servicesList[index]
                                      ["isSelected"] ==
                                  false) {
                                controller.servicesList[index]["isSelected"] =
                                    true;
                                controller.isOK.value = true;
                              } else {
                                controller.servicesList[index]["isSelected"] =
                                    false;

                                // to check if there exists other order that is selected or not
                                var counter = 0;
                                for (var i in controller.servicesList) {
                                  if (i["isSelected"] == true) {
                                    counter++;
                                  }
                                }
                                if (counter == 0) {
                                  controller.isOK.value = false;
                                }
                              }

                              controller.changed.value =
                                  !controller.changed.value;
                            },
                          );
                        },
                      );
                    })),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Obx(() {
                if (controller.isOK.value == true) {
                  return GestureDetector(
                    onTap: () async {
                      var bookedlist = controller.bookServices();
                      await controller.bookService(bookedlist);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8)),
                      height: 50.h,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text(
                          "Book Order",
                          style:
                              TextStyle(fontSize: 25.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    height: 50.h,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Book Order",
                          style:
                              TextStyle(fontSize: 25.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
              }),
            )
          ],
        ));
  }
}

class MyChip extends StatelessWidget {
  late String title;
  late IconData customicon;
  late Color? bgcolor;
  MyChip(
      {required this.title, required this.customicon, required this.bgcolor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.w),
      child: ActionChip(
        backgroundColor: bgcolor,
        avatar: Icon(
          customicon,
          size: 20.sp,
          color: bgcolor == Colors.white ? Colors.teal : Colors.white,
        ),
        label: Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              color: bgcolor == Colors.white ? Colors.teal : Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
