import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:phileclientapp/common/locationerror/locatnerrbox.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/dashboard/getstoreservc.dart';

class DashBoardController extends GetxController {
  var searchctrl = TextEditingController();
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
      listofstores.value = [res];
      print(listofstores);
      SnackBars.customsnack(res, Icons.close, Colors.red[800]!);
    } else {
      listofstores.value = res!;
    }
  }
}
