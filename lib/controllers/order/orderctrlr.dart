import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/loader/loader.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';
import 'package:phileclientapp/services/order/getordersrvc.dart';

import '../../common/snackbars/snackbars.dart';

class OrderController extends GetxController {
  late SARServices obj;
  late var id;
  var listoforder = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    obj = SARServices();
    id = await obj.getUserId();
    await getOrders();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
  }

  Future getOrders() async {
    UserOrderService obj1 = UserOrderService();
    // Loader.showLoader(
    //     animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
    //     title: "Fetching Your Orders");
    var res = await obj1.getOrderdetails(id);
    // Loader.hideLoader();
    // print(res);
    if (res == false) {
      listoforder.value = ["Internal Server Error"];
      SnackBars.customsnack(
          "Internal Server Error", Icons.close, Colors.red[800]!);
    } else if (res is String) {
      listoforder.value = ["Something Unexpected Occured"];
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else if (res == null) {
      listoforder.value = ["You Have Not Booked Any Services Yet"];
    } else {
      listoforder.value = res!;
    }
  }

  Future getOrdersWithPopUp() async {
    UserOrderService obj1 = UserOrderService();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Fetching Your Orders");
    var res = await obj1.getOrderdetails(id);
    Loader.hideLoader();
    // print(res);
    if (res == false) {
      listoforder.value = ["Internal Server Error"];
      SnackBars.customsnack(
          "Internal Server Error", Icons.close, Colors.red[800]!);
    } else if (res is String) {
      listoforder.value = ["Something Unexpected Occured"];
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else if (res == null) {
      listoforder.value = ["You Have Not Booked Any Services Yet"];
    } else {
      listoforder.value = res!;
    }
  }
}
