import 'package:esas_mobile/app/networks/api/pengajuan/api_lembur.dart';
import 'package:esas_mobile/constant.dart';
import 'package:get/get.dart';

import '../../models/list_lembur_model.dart';

class ListController extends GetxController {
  final ApiLembur provider = ApiLembur();
  final int _limit = 15;
  int _page = 1;
  var hasMore = true.obs;
  var list = <ListLemburModel>[].obs;

  Future loadMoreList() async {
    try {
      List<ListLemburModel> response =
          await provider.fetchPaginate(_page, _limit);
      if (response.length < _limit) {
        hasMore.value = false;
      }

      list.addAll(response);
      _page++;
    } catch (e) {
      showErrorSnackbar(e.toString());
    }
  }

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    list.value = [];

    await loadMoreList();
  }

  // Fungsi approval
  Future<void> approval(int id, String tablename, String status) async {
    try {
      await provider.approval(id, status, tablename);
    } catch (e) {
      showErrorSnackbar('Error: $e');
    }
    Get.back();
  }
}
