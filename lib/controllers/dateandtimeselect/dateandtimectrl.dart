import 'dart:convert';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../common/loader/loader.dart';
import '../../common/snackbars/snackbars.dart';
import '../../services/getavailtimeofstore/getavailtimesrvc.dart';

class DateAndTimeController extends GetxController {
  var timings = [
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 10, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 11, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 11, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 12, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 13, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 13, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 14, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 15, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 16, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 16, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 17, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 18, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 19, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 19, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 20, 30),
      "isselected": false
    },
    {
      "date": DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 0),
      "isselected": false
    },
    {
      "date": DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 21, 30),
      "isselected": false
    },
  ];
  var isVisible = false.obs;
  var changedtiming = false.obs;
  late String store_id, userid, storename, storeaddr;
  var bookedtime = [].obs;
  var date_selected = "Select Date Of Appointment".obs;
  var time_selected = "";
  var btncolor = Colors.grey.obs;
  Future getAvailTime(String storeid, String date) async {
    Getavailtimeservice obj = Getavailtimeservice();
    Loader.showLoader(
        animation: LottieBuilder.asset('assets/lottieefiles/loading.json'),
        title: "Fetching Available Times");
    var result = await obj.getAvailableTimeOfDay(storeid, date);
    Loader.hideLoader();

    if (result == true) {
      // todo empty list show all time to user no prev booked time
      if (date == DateTime.now().toString().substring(0, 11)) {
        var list = Extratime();
        if (list.isEmpty) {
          bookedtime.value = [1];
        } else {
          bookedtime.value = list;
        }
      } else {
        bookedtime.value = [1];
      }
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
      if (date == DateTime.now().toString().substring(0, 11)) {
        print("OK");
        var list = Extratime();
        bookedtime.value = result + list;
      } else {
        bookedtime.value = result;
      }
    }
  }

  void CheckandselectTime(index) {
    if (timings[index]["isselected"] == true) {
      timings[index]["isselected"] = false;
      btncolor.value = Colors.grey;
    } else {
      for (var i in timings) {
        if (i == timings[index]) {
          i["isselected"] = true;
          time_selected = DateFormat('h:mm a').format(i["date"] as DateTime);
        } else {
          i["isselected"] = false;
        }
      }
      btncolor.value = Colors.teal;
    }
  }

  bool isTimeAndDateEmpty() {
    if (date_selected.value == "Select A Date" || time_selected == "") {
      return false;
    } else {
      return true;
    }
  }

  List Extratime() {
    var list = [];
    var currenttime = DateTime.now();
    for (var i in timings) {
      if (currenttime.isAfter(i["date"] as DateTime)) {
        list.add(DateFormat('h:mm a').format(i["date"] as DateTime));
      } else {}
    }

    return list;
  }
}
