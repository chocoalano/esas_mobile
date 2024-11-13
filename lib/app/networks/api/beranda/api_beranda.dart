import 'dart:convert';

import 'package:esas_mobile/app/modules/home/models/anouncement_detail_model.dart';
import 'package:esas_mobile/app/modules/home/models/anouncement_model.dart';

import '../../base_http_services.dart';

class ApiBeranda extends BaseHttpService {
  final prefix = "/mobile";
  Future<dynamic> testNotifRequest() async {
    return await getRequest('/mobile/test-notif');
  }

  Future<List<AnouncementModel>> announcementRequest(
      int page, int limit) async {
    final response = await getRequest(
        '$prefix/announcement/list?page=$page&limit=$limit&search=');
    final data = jsonDecode(response.body)['data'];
    if (data != null && data.length > 0) {
      return List<AnouncementModel>.from(
          data.map((e) => AnouncementModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<AnouncementDetailModel> announcementRequestDetail(int id) async {
    final response = await getRequest('$prefix/announcement/detail/$id');
    final data = jsonDecode(response.body);
    return AnouncementDetailModel.fromJson(data);
  }
}
