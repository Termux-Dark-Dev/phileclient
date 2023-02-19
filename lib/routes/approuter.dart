import 'package:get/get.dart';
import 'package:phileclientapp/screens/home/homepage.dart';
import 'package:phileclientapp/screens/loginsignup/login.dart';
import 'package:phileclientapp/screens/loginsignup/signup.dart';
import 'package:phileclientapp/screens/otp/otp.dart';

import '../screens/order/orderpage.dart';

class RouterClass {
  static List<GetPage> routes = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/signup', page: () => SignupPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/otp', page: () => OTPPAGE()),
    GetPage(name: '/orderhistory', page: () => OderHistoryPage())
  ];
}
