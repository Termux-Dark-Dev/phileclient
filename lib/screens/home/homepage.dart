import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phileclientapp/screens/home/profile.dart';

import '../../controllers/homepage/HomePageController.dart';
import '../order/orderpage.dart';

import 'dashboard.dart';

class HomePage extends StatelessWidget {
  HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [DashBoard(), OderHistoryPage(), ProfilePage()],
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: BottomNavigationBar(
              onTap: controller.changetabindex,
              currentIndex: controller.tabIndex.value,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: "OrderHistory"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "profile")
              ],
            ),
          ),
        ),
      );
    }));
  }
}
