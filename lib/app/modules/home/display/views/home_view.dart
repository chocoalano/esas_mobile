// ignore_for_file: deprecated_member_use
import 'package:esas_mobile/components/BottomNavigation/bot_nav_view.dart';
import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'components/absencard.dart';
import 'components/anouncement.dart';
import 'components/empcard.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: SvgPicture.asset('assets/svg/logo_esas.svg',
            height: 30, width: 30, color: Colors.white),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(
              Icons.logout_sharp,
              color: bgColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Empcard(),
            const SizedBox(height: 20),
            Obx(
              () {
                final data = controller.userSchedule.value;
                if (data.id != null) {
                  return const Absencard();
                } else {
                  return const Center(
                    child: Text(
                      "Tidak ada jadwal absensi.",
                      style: TextStyle(color: dangerColor),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Anouncement(),
          ],
        ),
      ),
      bottomNavigationBar: BotNavView(),
    );
  }
}
