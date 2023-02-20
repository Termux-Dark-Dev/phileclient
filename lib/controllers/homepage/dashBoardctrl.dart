import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/locationerror/locatnerrbox.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/dashboard/getstoreservc.dart';
import '../../services/getavailtimeofstore/getavailtimesrvc.dart';

class DashBoardController extends GetxController {
  var selectedDate = "Selcted Date Of Service".obs;
  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();
  var expansionStatus = ExpansionStatus.contracted.obs;
  var searchctrl = TextEditingController();
  var bookedtime = [].obs;
  late var selectedstore;
  late String latitude, longitude;
  var listofstores = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
    await _getCurrentLocation().then((value) async {
      print(value.accuracy);
      print("latitude : " + value.latitude.toString());
      print("longitude : " + value.longitude.toString());
      latitude = value.latitude.toString();
      longitude = value.longitude.toString();
      await getStoreData(latitude, longitude);
    });
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
      if (permission == LocationPermission.deniedForever) {
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
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Searching Stores Near You");
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

  Future getAvailTime(String storeid, String date) async {
    Getavailtimeservice obj = Getavailtimeservice();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Fetching Available Times");
    var result = await obj.getAvailableTimeOfDay(storeid, date);
    Loader.hideLoader();
    print(result);
    if (result == true) {
      // todo empty list show all time to user no prev booked time
    } else if (result == null) {
      // todo exception occured
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else if (result == false) {
      // todo internal server err
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else {
      // todo ok add to list here
    }
  }
}
