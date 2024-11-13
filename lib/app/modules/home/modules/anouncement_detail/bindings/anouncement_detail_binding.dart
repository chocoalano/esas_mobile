import 'package:esas_mobile/app/networks/api/beranda/api_beranda.dart';
import 'package:get/get.dart';

import '../controllers/anouncement_detail_controller.dart';

class AnouncementDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnouncementDetailController>(
      () => AnouncementDetailController(),
    );
    Get.lazyPut<ApiBeranda>(
      () => ApiBeranda(),
    );
  }
}
