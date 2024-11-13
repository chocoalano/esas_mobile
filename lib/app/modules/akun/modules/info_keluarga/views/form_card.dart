import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import untuk format tanggal

import '../controllers/info_keluarga_controller.dart';

class FormCard extends StatelessWidget {
  final int index;
  final VoidCallback onRemove;
  final InfoKeluargaController controller = Get.find();

  FormCard({super.key, required this.index, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(
      text: controller.formData[index]['fullname'] ?? '',
    );
    final relationshipValue = _getValidRelationshipValue(
      controller.formData[index]['relationship'],
    );
    final birthdateController = TextEditingController(
      text: controller.formData[index]['birthdate'] ?? '',
    );
    final maritalStatusController = _getValidMaritalStatusValue(
      controller.formData[index]['marital_status'],
    );
    final jobController = TextEditingController(
      text: controller.formData[index]['job'] ?? '',
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
              onChanged: (value) =>
                  controller.updateForm(index, 'fullname', value),
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
              icon: Icons.family_restroom_outlined,
            ),
            const SizedBox(height: 10),
            _buildDatePicker(
              controller: birthdateController,
              hintText: 'Pilih tanggal lahir',
              icon: Icons.calendar_today,
              context: context, // Menambahkan context
              onChanged: (date) =>
                  controller.updateForm(index, 'birthdate', date),
            ),
            const SizedBox(height: 10),
            _buildDropdownField(
              value: maritalStatusController,
              items: const [
                DropdownMenuItem(value: 'single', child: Text('Lajang')),
                DropdownMenuItem(value: 'marriade', child: Text('Menikah')),
                DropdownMenuItem(value: 'widow', child: Text('Janda')),
                DropdownMenuItem(value: 'widower', child: Text('Duda')),
              ],
              onChanged: (value) {
                if (value != null) {
                  controller.updateForm(index, 'marital_status', value);
                }
              },
              icon: Icons.female_outlined,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: jobController,
              label: 'Profesi',
              icon: Icons.work_history_outlined,
              onChanged: (value) => controller.updateForm(index, 'job', value),
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

  /// Widget reusable untuk datepicker
  Widget _buildDatePicker({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required BuildContext context, // Menambahkan context
    required ValueChanged<String> onChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
          onChanged(formattedDate);
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: _inputDecoration(hintText, icon),
        ),
      ),
    );
  }

  /// Widget reusable untuk DropdownField
  Widget _buildDropdownField({
    required String? value,
    required IconData icon,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: _inputDecoration('Pilih', icon),
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

  String? _getValidMaritalStatusValue(String? value) {
    const validValues = ['single', 'marriade', 'widow', 'widower'];
    if (value == null || !validValues.contains(value)) {
      return null;
    }
    return value;
  }
}
