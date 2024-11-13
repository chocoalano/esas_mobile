import 'package:esas_mobile/app/modules/akun/display/bindings/akun_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_keluarga/bindings/info_keluarga_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_keluarga/views/info_keluarga_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_kontak_darurat/bindings/info_kontak_darurat_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_kontak_darurat/views/info_kontak_darurat_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_pekerjaan/bindings/info_pekerjaan_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_pekerjaan/views/info_pekerjaan_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_personal/bindings/info_personal_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_personal/views/info_personal_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_report_bugs/bindings/info_report_bugs_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_report_bugs/views/info_report_bugs_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_tambahan/bindings/info_tambahan_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_tambahan/views/info_tambahan_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/ubah_password/bindings/ubah_password_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/ubah_password/views/ubah_password_view.dart';
import 'package:esas_mobile/app/modules/akun/display/views/akun_view.dart';
import 'package:esas_mobile/auth_middleware.dart';
import 'package:get/get.dart';

class AkunRoutes {
  static const path = '/akun';
  static final routes = [
    GetPage(
        name: path,
        page: () => const AkunView(),
        binding: AkunBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-personal',
        page: () => const InfoPersonalView(),
        binding: InfoPersonalBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-report-bugs',
        page: () => InfoReportBugsView(),
        binding: InfoReportBugsBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-pekerjaan',
        page: () => const InfoPekerjaanView(),
        binding: InfoPekerjaanBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-kontak-darurat',
        page: () => const InfoKontakDaruratView(),
        binding: InfoKontakDaruratBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-keluarga',
        page: () => const InfoKeluargaView(),
        binding: InfoKeluargaBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-tambahan',
        page: () => const InfoTambahanView(),
        binding: InfoTambahanBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/ubah-password',
        page: () => const UbahPasswordView(),
        binding: UbahPasswordBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
  ];
}
