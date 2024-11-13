import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bot_nav_controller.dart';

class BotNavView extends StatelessWidget {
  BotNavView({super.key});

  // Get the controller instance
  final BotNavController controller = Get.find<BotNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Karyawan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_open),
              label: 'Pengajuan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storage_rounded),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Akun',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: bgColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 15,
          unselectedLabelStyle: _unselectedLabelStyle,
          selectedLabelStyle: _selectedLabelStyle,
          showUnselectedLabels: true,
          currentIndex: controller.pageIndex.value,
          onTap: controller.changePage,
        ));
  }

  // Define styles outside of the build method to make it cleaner
  static const TextStyle _selectedLabelStyle = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const TextStyle _unselectedLabelStyle = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.normal,
    fontSize: 13,
  );
}
