import 'package:esas_mobile/app/modules/akun/modules/info_kontak_darurat/controllers/info_kontak_darurat_controller.dart';
import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormCard extends StatelessWidget {
  final int index;
  final VoidCallback onRemove;
  final InfoKontakDaruratController controller = Get.find();

  FormCard({super.key, required this.index, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    // Ambil value yang valid atau fallback ke null jika tidak valid
    final relationshipValue = _getValidRelationshipValue(
      controller.formData[index]['relationship'],
    );

    // Ambil nilai awal dari formData berdasarkan index
    final nameController = TextEditingController(
      text: controller.formData[index]['name'] ?? '',
    );
    final phoneController = TextEditingController(
      text: controller.formData[index]['phone'] ?? '',
    );
    final professionController = TextEditingController(
      text: controller.formData[index]['profession'] ?? '',
    );

    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildRemoveButton(),
            const SizedBox(height: 10),
            _buildTextField(
              controller: nameController,
              label: 'Nama',
              icon: Icons.account_box,
              onChanged: (value) => controller.updateForm(index, 'name', value),
            ),
            const SizedBox(height: 10),
            _buildDropdownField(
              value: relationshipValue,
              items: const [
                DropdownMenuItem(value: 'wife', child: Text('Istri')),
                DropdownMenuItem(value: 'husband', child: Text('Suami')),
                DropdownMenuItem(value: 'mother', child: Text('Ibu')),
                DropdownMenuItem(value: 'father', child: Text('Ayah')),
                DropdownMenuItem(
                    value: 'brother', child: Text('Saudara Laki-laki')),
                DropdownMenuItem(
                    value: 'sister', child: Text('Saudara perempuan')),
                DropdownMenuItem(value: 'child', child: Text('Anak')),
              ],
              onChanged: (value) {
                if (value != null) {
                  controller.updateForm(index, 'relationship', value);
                }
              },
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: phoneController,
              label: 'Telpon/HP',
              icon: Icons.phone_android_outlined,
              onChanged: (value) =>
                  controller.updateForm(index, 'phone', value),
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: professionController,
              label: 'Profesi',
              icon: Icons.work_history_outlined,
              onChanged: (value) =>
                  controller.updateForm(index, 'profession', value),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// Widget untuk tombol remove card
  Widget _buildRemoveButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: onRemove,
          icon: const Icon(
            Icons.remove_circle_outline,
            color: dangerColor,
          ),
        ),
      ],
    );
  }

  /// Widget reusable untuk TextField dengan controller
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      controller: controller, // Menggunakan controller untuk set nilai awal
      decoration: _inputDecoration(label, icon),
      onChanged: onChanged,
    );
  }

  /// Widget reusable untuk DropdownField
  Widget _buildDropdownField({
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration:
          _inputDecoration('Pilih hubungan', Icons.account_box_outlined),
    );
  }

  /// InputDecoration yang dapat digunakan kembali
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      fillColor: primaryColor.withOpacity(0.1),
      filled: true,
      prefixIcon: Icon(icon),
    );
  }

  /// Fungsi untuk memastikan value ada di dalam item list
  String? _getValidRelationshipValue(String? value) {
    const validValues = [
      'wife',
      'husband',
      'mother',
      'father',
      'brother',
      'sister',
      'child'
    ];

    if (value == null || !validValues.contains(value)) {
      return null;
    }
    return value;
  }
}
