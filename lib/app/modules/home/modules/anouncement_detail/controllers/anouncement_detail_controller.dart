import 'package:esas_mobile/app/modules/home/models/anouncement_detail_model.dart';
import 'package:esas_mobile/app/networks/api/beranda/api_beranda.dart';
import 'package:esas_mobile/constant.dart';
import 'package:get/get.dart';

class AnouncementDetailController extends GetxController {
  final ApiBeranda provider = Get.put(ApiBeranda());
  late final int id;
  var isLoading = false.obs;
  var announcementDetail = AnouncementDetailModel().obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    showDetail();
  }

  void showDetail() async {
    try {
      isLoading(true);
      final response = await provider.announcementRequestDetail(id);
      announcementDetail.value = response;
    } catch (e) {
      showErrorSnackbar('Error : ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
