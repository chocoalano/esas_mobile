import 'dart:io';
import 'package:http/http.dart' as http;
import '../../base_http_services.dart';

class ApiAuth extends BaseHttpService {
  Future<dynamic> saveSubmitBugs(
      Map<String, dynamic> datapost, File file) async {
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'pictureProof',
      file.path,
    );
    final response =
        await postFormDataRequest('/mobile/bug', datapost, [multipartFile]);
    return response.statusCode;
  }

  Future<dynamic> saveChangeAvatar(
      Map<String, dynamic> datapost, File file) async {
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'image',
      file.path,
    );
    final response = await postFormDataRequest(
        '/user-update/avatar', datapost, [multipartFile]);
    return response.statusCode;
  }

  Future<dynamic> saveSubmitDataDiri(Map<String, dynamic> datapost) async {
    final response = await postRequest('/user-update/data-diri', datapost);
    return response.statusCode;
  }

  Future<dynamic> getProfile() async {
    return await getRequest('/user-auth');
  }

  Future<dynamic> submitLogin(Map<String, dynamic> datapost) async {
    return await postRequest('/login', datapost);
  }

  Future<dynamic> submitLogout() async {
    return await getRequest('/logout');
  }

  Future<dynamic> saveSubmitBank(Map<String, dynamic> datapost) async {
    return await postRequest('/user-update/update_bank', datapost);
  }

  Future<dynamic> saveSubmitPassword(Map<String, dynamic> datapost) async {
    return await postRequest('/user-update/ubah-password', datapost);
  }
}
