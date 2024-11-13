import 'dart:convert';
import 'package:esas_mobile/app/modules/pengajuan/modules/lembur/models/list_lembur_model.dart';
import 'package:esas_mobile/services/storage.dart';
import 'package:get/get.dart';
import '../../base_http_services.dart';

class ApiLembur extends BaseHttpService {
  final Storage storage = Get.find<Storage>();
  final prefix = "/mobile";

  Future<List<ListLemburModel>> fetchPaginate(int page, int limit) async {
    final response =
        await getRequest('$prefix/lembur/list?page=$page&limit=$limit');
    final data = jsonDecode(response.body)['list']['data'];
    if (data != null && data.length > 0) {
      return List<ListLemburModel>.from(
          data.map((e) => ListLemburModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<dynamic> fetchForms() async {
    return await getRequest('$prefix/lembur/list');
  }

  Future<dynamic> fetchUserForms(int userId) async {
    return await getRequest('$prefix/lembur/list?userId=$userId');
  }

  Future<dynamic> fetchApproval(String date) async {
    return await getRequest('$prefix/lembur/list?date=$date');
  }

  Future<dynamic> submitCreate(List<Map<String, dynamic>> dataPost) async {
    Map<String, dynamic> payload = {'datapost': dataPost};
    return await postRequest('$prefix/lembur/list', payload);
  }

  Future<dynamic> approval(int id, String status, String tableName) async {
    return await putRequest(
        '$prefix/notification/approval/$id/$tableName', {'status': status});
  }
}
