import 'dart:convert';

import 'package:esas_mobile/app/networks/api/akun/api_auth.dart';
import 'package:esas_mobile/app/networks/api/akun/api_kontak_darurat.dart';
import 'package:esas_mobile/constant.dart';
import 'package:get/get.dart';

class InfoKontakDaruratController extends GetxController {
  final ApiAuth provider = Get.find<ApiAuth>();
  final ApiEmergencyContact apiKontakDarurat = Get.find<ApiEmergencyContact>();
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
    formData
        .add({'name': '', 'relationship': '', 'phone': '', 'profession': ''});
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
        final emergencyContacts = fetch['account']['emergencyContact'];
        if (emergencyContacts is List) {
          formData.clear(); // Kosongkan formData sebelum menambahkan data baru
          for (var contact in emergencyContacts) {
            formData.add({
              'name': contact['name'] ?? '',
              'relationship': contact['relationship'] ?? '',
              'phone': contact['phone'] ?? '',
              'profession': contact['profesion'] ?? '',
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
      await apiKontakDarurat.saveSubmit(formData);
      getProfile();
      showSuccessSnackbar('Data berhasil diperbarui');
    } catch (e) {
      showErrorSnackbar('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
