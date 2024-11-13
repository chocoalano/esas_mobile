import 'package:esas_mobile/components/BottomNavigation/bot_nav_controller.dart';
import 'package:esas_mobile/constant.dart';
import 'package:esas_mobile/services/notif_service.dart';
import 'package:esas_mobile/services/storage.dart';
import 'package:esas_mobile/services/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Storage());
  Get.put(NotificationController());
  final NotifService notificationService = Get.put(NotifService());
  await GetStorage.init();
  await notificationService.initialize();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Set up GetX dependency injection
  Get.put(BotNavController(), permanent: true);

  // Run the app
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor, // Set background color here
      ),
      getPages: AppPages.routes,
    ),
  );
}
