import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/locationerror/locatnerrbox.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/dashboard/getstoreservc.dart';
import '../../services/getavailtimeofstore/getavailtimesrvc.dart';

class DashBoardController extends GetxController {
  var selectedDate = "Selcted Date Of Service".obs;
  var searchctrl = TextEditingController();
  SARServices sobj = SARServices();
  late String latitude, longitude, userid;
  var listofstores = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    userid = await sobj.getUserId();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await _getCurrentLocation().then((value) {
      latitude = value.latitude.toString();
      longitude = value.longitude.toString();
    });
    await getStoreData(latitude, longitude);
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      LocationErrur.locationerror();
      return Future.error('Location Are Disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // LocationErrur.locatinodeniedForever();
      if (permission == LocationPermission.deniedForever) {
        LocationErrur.locatinodeniedForever();
        return Future.error('Location Permission are forever denied');
      }
      if (permission == LocationPermission.denied) {
        LocationErrur.locatinodeniedForever();
        return Future.error('Location Permission are forever denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      LocationErrur.locatinodeniedForever();
      return Future.error('Location Permission are forever denied');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future getStoreData(String lati, String longi) async {
    GetStoreDetails obj = GetStoreDetails();
    // Loader.showLoader(
    //     animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
    //     title: "Searching Stores Near You");
    var res = await obj.getStoreData(lati, longi);
    // Loader.hideLoader();
    if (res == null) {
      listofstores.value = ["Internal Server Error"];
      SnackBars.customsnack(
          "Internal Server Error", Icons.close, Colors.red[800]!);
    } else if (res is String) {
      listofstores.value = ["Something Unexpected Occured"];

      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else {
      listofstores.value = res!;
    }
  }

  Future getStoreDataWithPopUP(String lati, String longi) async {
    GetStoreDetails obj = GetStoreDetails();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Refreshing");
    var res = await obj.getStoreData(lati, longi);
    Loader.hideLoader();
    if (res == null) {
      listofstores.value = ["Internal Server Error"];
      SnackBars.customsnack(
          "Internal Server Error", Icons.close, Colors.red[800]!);
    } else if (res is String) {
      listofstores.value = ["Something Unexpected Occured"];

      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else {
      listofstores.value = res!;
    }
  }
}
