import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/getavailtimeofstore/getavailtimesrvc.dart';

class DateAndTimeController extends GetxController {
  var timings = [
    {"date": "08:00 AM", "isfree": true, "isselected": false},
    {"date": "08:30 AM", "isfree": true, "isselected": false},
    {"date": "09:00 AM", "isfree": true, "isselected": false},
    {"date": "09:30 AM", "isfree": true, "isselected": false},
    {"date": "10:00 AM", "isfree": true, "isselected": false},
    {"date": "10:30 AM", "isfree": true, "isselected": false},
    {"date": "11:00 AM", "isfree": true, "isselected": false},
    {"date": "11:30 AM", "isfree": true, "isselected": false},
    {"date": "12:00 PM", "isfree": true, "isselected": false},
    {"date": "12:30 PM", "isfree": true, "isselected": false},
    {"date": "1:00 PM", "isfree": true, "isselected": false},
    {"date": "1:30 PM", "isfree": true, "isselected": false},
    {"date": "2:00 PM", "isfree": true, "isselected": false},
    {"date": "2:30 PM", "isfree": true, "isselected": false},
    {"date": "3:00 PM", "isfree": true, "isselected": false},
    {"date": "3:30 PM", "isfree": true, "isselected": false},
    {"date": "4:00 PM", "isfree": true, "isselected": false},
    {"date": "4:30 PM", "isfree": true, "isselected": false},
    {"date": "5:00 PM", "isfree": true, "isselected": false},
    {"date": "5:30 PM", "isfree": true, "isselected": false},
    {"date": "6:00 PM", "isfree": true, "isselected": false},
    {"date": "6:30 PM", "isfree": true, "isselected": false},
    {"date": "7:00 PM", "isfree": true, "isselected": false},
    {"date": "7:30 PM", "isfree": true, "isselected": false},
    {"date": "8:00 PM", "isfree": true, "isselected": false},
    {"date": "8:30 PM", "isfree": true, "isselected": false},
    {"date": "9:00 PM", "isfree": true, "isselected": false},
    {"date": "9:30 PM", "isfree": true, "isselected": false},
  ];
  late String store_id, userid;
  var bookedtime = [].obs;
  var date_selected = "Select A Date".obs;

  Future getAvailTime(String storeid, String date) async {
    print(storeid);
    Getavailtimeservice obj = Getavailtimeservice();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Fetching Available Times");
    var result = await obj.getAvailableTimeOfDay(storeid, date);
    Loader.hideLoader();
    print(result);
    if (result == true) {
      // todo empty list show all time to user no prev booked time
      bookedtime.value = [1];
    } else if (result == null) {
      // todo exception occured
      bookedtime.value = [2];
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else if (result == false) {
      // todo internal server err
      bookedtime.value = [2];
      SnackBars.customsnack(
          "Something Unexpected Occured", Icons.close, Colors.red[800]!);
    } else {
      // todo ok add to list here
      bookedtime.value = result;
    }
  }
}
