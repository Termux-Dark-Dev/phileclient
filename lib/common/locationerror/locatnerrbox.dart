import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocationErrur {
  static void locationerror() {
    Get.dialog(WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('Location Service'),
        content: Container(
          height: 200,
          width: 300,
          child: Column(
            children: [
              Flexible(
                  child: Text(
                      'Please Enable Location Service If You Want Your Store To List On The Users App ')),
              Flexible(
                  child: Text(
                      "To Enable Location -> Go To Navigation Bar-> Find Location Icon -> Enable the location ")),
              Flexible(
                  child: ElevatedButton(
                onPressed: () {
                  AppSettings.openLocationSettings();
                  SystemNavigator.pop();
                },
                child: Text("Close"),
              ))
            ],
          ),
        ),
      ),
    ));
  }

  static void locatinodeniedForever() {
    Get.dialog(WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('Location Service'),
        content: Container(
          height: 200,
          width: 300,
          child: Column(
            children: [
              Flexible(
                  child: Text(
                      'Please Enable Location Service If You Want Your Store To List On The Users App ')),
              Flexible(
                  child: Text(
                      "To Enable Location -> Go To Settings -> Permissions -> Enable the location permission")),
              Flexible(
                  child: ElevatedButton(
                onPressed: () {
                  AppSettings.openLocationSettings();
                  SystemNavigator.pop();
                },
                child: Text("Close"),
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
