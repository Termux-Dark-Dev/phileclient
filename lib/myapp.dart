import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/routes/approuter.dart';
import 'package:phileclientapp/screens/home/homepage.dart';
import 'package:phileclientapp/services/SAR/sarservices.dart';

import 'screens/loginsignup/login.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: RouterClass.routes,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
        ),
        home: FutureBuilder(
          future: SARServices.isUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              bool isLoggedin = snapshot.data as bool;
              if (isLoggedin) {
                return HomePage();
              } else {
                return Login();
              }
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
      designSize: Size(428, 926),
    );
  }
}
