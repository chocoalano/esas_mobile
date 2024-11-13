import 'dart:convert';

import 'package:esas_mobile/app/networks/api/akun/api_auth.dart';
import 'package:esas_mobile/app/networks/api/akun/api_auth_family.dart';
import 'package:esas_mobile/constant.dart';
import 'package:get/get.dart';

class InfoKeluargaController extends GetxController {
  final ApiAuth provider = Get.find<ApiAuth>();
  final ApiAuthFamily apiFamily = Get.find<ApiAuthFamily>();
  var formData = <Map<String, String>>[].obs;
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
      'fullname': '',
      'relationship': '',
      'birthdate': '',
      'marital_status': '',
      'job': ''
    });
  }

  // Hapus form berdasarkan index jika lebih dari satu form
  void removeForm(int index) {
    if (formData.length > 1) {
      formData.removeAt(index);
    }
  }

  // Update form berdasarkan key dan value
  void updateForm(int index, String key, String value) {
    formData[index][key] = value;
    formData.refresh();
  }

  // Ambil data profil pengguna
  Future<void> getProfile() async {
    isLoading(true);
    try {
      final response = await provider.getProfile();
      if (response.statusCode == 200) {
        final fetch = jsonDecode(response.body) as Map<String, dynamic>;
        final family = fetch['account']['family'];
        if (family is List) {
          formData.clear(); // Kosongkan formData sebelum menambahkan data baru
          for (var contact in family) {
            formData.add({
              'fullname': contact['fullname'] ?? '',
              'relationship': contact['relationship'] ?? '',
              'birthdate': contact['birthdate'] ?? '',
              'marital_status': contact['maritalStatus'] ?? '',
              'job': contact['job'] ?? '',
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
      final response = await apiFamily.saveSubmit(formData);
      if (response.statusCode == 200) {
        getProfile();
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
