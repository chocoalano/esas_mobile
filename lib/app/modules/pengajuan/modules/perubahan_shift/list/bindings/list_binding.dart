import 'package:esas_mobile/app/networks/api/pengajuan/api_perubahan_shift.dart';
import 'package:get/get.dart';

import '../controllers/list_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(
      () => ListController(),
    );
    Get.lazyPut<ApiPerubahanShift>(
      () => ApiPerubahanShift(),
    );
  }
}
