import 'package:esas_mobile/app/networks/api/api_karyawan.dart';
import 'package:get/get.dart';

import '../controllers/karyawan_controller.dart';

class KaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KaryawanController>(
      () => KaryawanController(),
    );
    Get.lazyPut<ApiKaryawan>(
      () => ApiKaryawan(),
    );
  }
}
