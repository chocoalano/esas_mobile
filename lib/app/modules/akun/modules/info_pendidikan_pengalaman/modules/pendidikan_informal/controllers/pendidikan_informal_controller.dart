import 'dart:convert';

import 'package:esas_mobile/app/networks/api/akun/api_auth.dart';
import 'package:esas_mobile/app/networks/api/akun/api_info_pendidikan_pengalaman.dart';
import 'package:esas_mobile/constant.dart';
import 'package:get/get.dart';

class PendidikanInformalController extends GetxController {
  final ApiAuth provider = Get.find<ApiAuth>();
  final ApiInfoPendidikanPengalaman apiRepositories =
      Get.find<ApiInfoPendidikanPengalaman>();
  var formData = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addForm(); // Menambahkan form kosong pada saat inisialisasi
    getProfile();
  }

  // Tambahkan form baru
  void addForm() {
    formData.add({
      'name': '',
      'start': '',
      'finish': '',
      'expired': '',
      'type': 'day',
      'duration': '',
      'fee': '',
      'description': '',
      'certification': false,
    });
  }

  // Hapus form berdasarkan index jika lebih dari satu form
  void removeForm(int index) {
    if (formData.length > 1) {
      formData.removeAt(index);
    }
  }

  // Update form berdasarkan key dan value
  void updateForm(int index, String key, dynamic value) {
    if (key == 'certification' && value is bool) {
      formData[index][key] = value;
    } else if (value is String) {
      formData[index][key] = value;
    }
    formData.refresh();
  }

  // Ambil data profil pengguna
  Future<void> getProfile() async {
    isLoading(true);
    try {
      final response = await provider.getProfile();
      if (response.statusCode == 200) {
        final formal =
            jsonDecode(response.body)['account']['informalEducation'];
        if (formal is List) {
          formData.clear();
          for (var e in formal) {
            formData.add({
              'name': e['name'] ?? '',
              'start': e['start'] ?? '',
              'finish': e['finish'] ?? '',
              'expired': e['expired'] ?? '',
              'type': e['type'] ?? 'day',
              'duration': e['duration'].toString(),
              'fee': e['fee'].toString(),
              'description': e['description'] ?? '',
              'certification': e['certification'] > 0 ? true : false,
            });
          }
        }
      } else {
        showErrorSnackbar('Error: ${response.statusCode}');
      }
    } catch (e) {
      showErrorSnackbar('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  // Simpan profil ke server
  Future<void> saveProfile() async {
    isLoading(true);
    try {
      final response = await apiRepositories.saveSubmit(formData, 'p_informal');
      if (response.statusCode == 200) {
        showSuccessSnackbar('Data berhasil diperbarui');
      } else {
        showErrorSnackbar('Error: $response');
      }
    } catch (e) {
      showErrorSnackbar('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
