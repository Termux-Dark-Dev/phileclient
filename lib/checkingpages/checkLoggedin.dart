import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/home/homepage.dart';
import '../screens/loginsignup/login.dart';
import '../services/SAR/sarservices.dart';

class CheckLoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
