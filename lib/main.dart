import 'dart:async';
import 'package:driverapp/constants/strings.dart';
import 'package:driverapp/controllers/dashboard_controller.dart';
import 'package:driverapp/controllers/user_controller.dart';
import 'package:driverapp/firebase_options.dart';
import 'package:driverapp/main_screen.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification_services.dart';
import 'route/app_pages.dart';
import 'screens/AddRadius/googlemap.dart';
import 'screens/Dashboard/markermovement.dart';
import 'widgets/table-calender.dart';
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
Future initServices() async {
  print("print init");
    Get.put<DashboardContoller>(DashboardContoller());

  await Get.putAsync(() => UserServices().init());
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await initServices();

    runApp(const DriverApp());
 
}
NotificationServices notificationServices = NotificationServices();




class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
        notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    print("driver app");
    // return GetMaterialApp(
    //   title: AppStrings.appname,
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     fontFamily: GoogleFonts.poppins().fontFamily,
    //     appBarTheme: const AppBarTheme(elevation: 0, color: Colors.white),
    //   ),
    //   home: const MyHomePage(),
    // );
    return GetMaterialApp(
      title: AppStrings.appname,
      // home:  TableEventsExample(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}

