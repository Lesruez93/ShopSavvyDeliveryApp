import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsavvy_delivery_app/routes/app_pages.dart';
import 'package:shopsavvy_delivery_app/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await DatabaseHelper.createDatabase(); // Initialize the local database
  // await ConnectivityManager.start(); // Start monitoring connectivity and trigger sync

  runApp(GetMaterialApp(
    title: "Application",
    debugShowCheckedModeBanner: false,
    initialRoute: await isAuthenticated() ? Routes.TABS : Routes.LOGIN,
    getPages: AppPages.routes,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      //primaryColor: AppColor.primary,
      fontFamily: 'inter',
    ),
  ));
}
