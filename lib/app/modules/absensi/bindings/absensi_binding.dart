import 'package:get/get.dart';

import 'package:esas_mobile/app/modules/absensi/controllers/gps_controller.dart';
import 'package:esas_mobile/app/modules/absensi/controllers/list_controller.dart';
import 'package:esas_mobile/app/modules/absensi/controllers/photo_controller.dart';
import 'package:esas_mobile/app/networks/api/beranda/api_absen.dart';

import '../controllers/absensi_controller.dart';

class AbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(
      () => ListController(),
    );
    Get.lazyPut<GpsController>(
      () => GpsController(),
    );
    Get.lazyPut<PhotoController>(
      () => PhotoController(),
    );
    Get.lazyPut<AbsensiController>(
      () => AbsensiController(),
    );
    Get.lazyPut<ApiAbsen>(
      () => ApiAbsen(),
    );
  }
}
