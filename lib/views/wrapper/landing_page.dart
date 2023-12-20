import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsavvy_delivery_app/views/home/home_view.dart';
import 'package:shopsavvy_delivery_app/views/home/sub_home_view.dart';
import 'package:shopsavvy_delivery_app/views/login/views/login_view.dart';
import 'package:shopsavvy_delivery_app/views/player/player_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import '../login/controllers/landing_page_controller.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          //height: 54,
          child: SalomonBottomBar(
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
           // iconSize: 30,
              items: [
                SalomonBottomBarItem(
                  icon:  Icon(CupertinoIcons.home),
                  title: Text('Home'),
                  selectedColor: Colors.purple,

                ),
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.clock),
                  title: Text('Order History'),
                  selectedColor: Colors.pink,

                ),
                // SalomonBottomBarItem(
                //   icon: Icon(CupertinoIcons.home),
                //   selectedColor: Colors.orange,
                //
                //   title: Text('Home'),
                // ),
                SalomonBottomBarItem(
                  icon: Icon(CupertinoIcons.settings),
                  title: Text('Settings'),
                  selectedColor: Colors.teal,

                ),
              ],

          ),
        )));
  }



  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [HomeView(), SubHomeView(),  SettingsView()],
          )),
    ));
  }


}
