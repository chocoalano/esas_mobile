import 'dart:convert';
import 'dart:io';
import 'package:esas_mobile/app/data/attendance_model.dart';
import 'package:http/http.dart' as http;
import '../../base_http_services.dart';

class ApiAbsen extends BaseHttpService {
  final prefix = "/mobile";
  Future<dynamic> saveSubmit(Map<String, dynamic> datapost, File file) async {
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'photo',
      file.path,
    );
    return await postFormDataRequest(
        '$prefix/attendance/add', datapost, [multipartFile]);
  }

  Future<dynamic> fetchTime() async {
    return await getRequest('/web/time-all');
  }

  Future<List<Attendance>> fetchPaginate(
      int page, int limit, String filter) async {
    final response = await getRequest(
        '$prefix/attendance/list?page=$page&limit=$limit&search=$filter');
    final data = jsonDecode(response.body);
    if (data['data'] != null && data['data'].length > 0) {
      return List<Attendance>.from(
          data['data'].map((e) => Attendance.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<dynamic> fetchCurrentShift() async {
    return await getRequest('$prefix/attendance/current-shift');
  }

  Future<dynamic> fetchCurrentAbsen() async {
    return await getRequest('$prefix/attendance/current-date');
  }

  Future<dynamic> fetchLocationAbsen() async {
    return await getRequest('$prefix/attendance/current-office');
  }

  Future<dynamic> getRevisionAbsen(String date) async {
    return await getRequest('$prefix/attendance/revision/$date');
  }
}
