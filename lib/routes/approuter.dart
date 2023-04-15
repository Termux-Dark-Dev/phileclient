import 'package:get/get.dart';
import 'package:phileclientapp/checkingpages/checkhomepageconnectivity.dart';
import 'package:phileclientapp/checkingpages/checkloginpageconnectivity.dart';
import 'package:phileclientapp/controllers/order/orderctrlr.dart';
import 'package:phileclientapp/screens/contact/contactuspage.dart';
import 'package:phileclientapp/screens/interneterrorpage/interneterrorpage.dart';
import 'package:phileclientapp/screens/bookedanim/booked.dart';
import 'package:phileclientapp/screens/forgotpass/ForgotPassPage.dart';
import 'package:phileclientapp/screens/home/dashboard.dart';
import 'package:phileclientapp/screens/home/homepage.dart';
import 'package:phileclientapp/screens/home/profile.dart';
import 'package:phileclientapp/screens/home/selectdatetime.dart';
import 'package:phileclientapp/screens/loginsignup/login.dart';
import 'package:phileclientapp/screens/loginsignup/signup.dart';
import 'package:phileclientapp/screens/otp/emailupdateotp.dart';
import 'package:phileclientapp/screens/otp/forgotpassotp.dart';
import 'package:phileclientapp/screens/otp/otp.dart';
import 'package:phileclientapp/screens/otp/phoneupdateotp.dart';
import 'package:phileclientapp/screens/services/services.dart';

import '../screens/order/orderpage.dart';

class RouterClass {
  static List<GetPage> routes = [
    GetPage(name: '/dash', page: () => DashBoard()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/signup', page: () => SignupPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/otp', page: () => OTPPAGE()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/orderhistory', page: () => OderHistoryPage()),
    GetPage(name: '/booktimeslot', page: () => SelectDateAndTime()),
    GetPage(name: '/emailupdateotp', page: () => EmailUpdateOTP()),
    GetPage(name: '/phoneupdateotp', page: () => PhoneUpdateOTP()),
    GetPage(name: '/services', page: () => ServicePage()),
    GetPage(name: '/forgotpassotp', page: () => ForgotPassOTP()),
    GetPage(name: '/forgotpasspage', page: () => ForgotPassPage()),
    GetPage(name: '/orderdone', page: () => OrderDonePage()),
    GetPage(name: '/interneterror', page: () => InternetErrorPage()),
    GetPage(
        name: '/chkhomepageconnectivity',
        page: () => CheckHomePageConnectivity()),
    GetPage(
        name: '/chkloginpageconnectivity',
        page: () => CheckLoginPageConnectivity()),
    GetPage(name: '/contactus', page: () => ContactUsPage()),
  ];
}
