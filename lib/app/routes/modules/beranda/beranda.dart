import 'package:esas_mobile/app/modules/absensi/bindings/absensi_binding.dart';
import 'package:esas_mobile/app/modules/absensi/views/absensi_view.dart';
import 'package:esas_mobile/app/modules/home/display/bindings/home_binding.dart';
import 'package:esas_mobile/app/modules/home/display/views/components/photo_screen.dart';
import 'package:esas_mobile/app/modules/home/display/views/home_view.dart';
import 'package:esas_mobile/auth_middleware.dart';
import 'package:get/get.dart';

import 'package:esas_mobile/app/modules/home/modules/anouncement_detail/views/anouncement_detail_screen.dart';
import 'package:esas_mobile/app/modules/home/modules/anouncement_detail/bindings/anouncement_detail_binding.dart';

class BerandaRoutes {
  static const path = '/beranda';
  static final routes = [
    GetPage(
        name: path,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/anouncement',
        page: () => const AnouncementDetailScreen(),
        binding: AnouncementDetailBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/absen',
        page: () => const AbsensiView(),
        binding: AbsensiBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/absen/photo',
        page: () => const PhotoScreen(),
        binding: AbsensiBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()])
  ];
}
