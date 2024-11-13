import 'package:esas_mobile/app/modules/akun/modules/info_pendidikan_pengalaman/modules/pendidikan_formal/controllers/pendidikan_formal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../display/widget/btn_remove.dart';
import '../../../display/widget/checked_field.dart';
import '../../../display/widget/datepicker_field.dart';
import '../../../display/widget/dropdown_field.dart';
import '../../../display/widget/text_field.dart';

class FormCard extends StatelessWidget {
  final int index;
  final VoidCallback onRemove;
  final AkunPendidikanFormalController controller = Get.find();

  FormCard({super.key, required this.index, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            RemoveButton(onRemove: onRemove),
            const SizedBox(height: 10),
            CustomTextField(
              controller: TextEditingController(
                text: controller.formData[index]['institution'] ?? '',
              ),
              label: 'Nama',
              icon: Icons.account_box,
              onChanged: (value) =>
                  controller.updateForm(index, 'institution', value),
            ),
            const SizedBox(height: 10),
            DropdownField(
              value: _getValidRelationshipValue(
                controller.formData[index]['majors'],
              ),
              items: const [
                DropdownMenuItem(value: 'SD', child: Text('SD')),
                DropdownMenuItem(value: 'SMP', child: Text('SMP')),
                DropdownMenuItem(value: 'SMA/SLTA', child: Text('SMA/SLTA')),
                DropdownMenuItem(value: 'D1', child: Text('D1')),
                DropdownMenuItem(value: 'D2', child: Text('D2')),
                DropdownMenuItem(value: 'D3', child: Text('D3')),
                DropdownMenuItem(value: 'D4', child: Text('D4')),
                DropdownMenuItem(value: 'S1', child: Text('S1')),
                DropdownMenuItem(value: 'S2', child: Text('S2')),
                DropdownMenuItem(value: 'S3', child: Text('S3')),
              ],
              onChanged: (value) {
                if (value != null) {
                  controller.updateForm(index, 'majors', value);
                }
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: TextEditingController(
                text: controller.formData[index]['score'] ?? '',
              ),
              label: 'Skor/IPK',
              icon: Icons.phone_android_outlined,
              onChanged: (value) =>
                  controller.updateForm(index, 'score', value),
            ),
            const SizedBox(height: 10),
            DatePickerInput(
              controller: TextEditingController(
                text: controller.formData[index]['start'] ?? '',
              ),
              hintText: 'Pilih tanggal mulai',
              icon: Icons.calendar_today,
              onChanged: (date) => controller.updateForm(index, 'start', date),
            ),
            const SizedBox(height: 10),
            DatePickerInput(
              controller: TextEditingController(
                text: controller.formData[index]['finish'] ?? '',
              ),
              hintText: 'Pilih tanggal selesai',
              icon: Icons.calendar_today,
              onChanged: (date) => controller.updateForm(index, 'finish', date),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: TextEditingController(
                text: controller.formData[index]['description'] ?? '',
              ),
              label: 'Deskripsi',
              icon: Icons.description_outlined,
              onChanged: (value) =>
                  controller.updateForm(index, 'description', value),
            ),
            const SizedBox(height: 10),
            CheckedField(
              isChecked: controller.formData[index]['certification'] ?? false,
              label: 'Apakah pendidikan ini tersertifikasi?',
              icon: Icons.check_box,
              onChanged: (value) {
                controller.updateForm(index, 'certification', value);
              },
            ),
          ],
        ),
      ),
    );
  }

  String? _getValidRelationshipValue(String? value) {
    const validValues = [
      'SD',
      'SMP',
      'SMA/SLTA',
      'D1',
      'D2',
      'D3',
      'D4',
      'S1',
      'S2',
      'S3',
    ];

    if (value == null || !validValues.contains(value)) {
      return null;
    }
    return value;
  }
}
