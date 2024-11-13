import 'package:esas_mobile/components/btn_action.dart';
import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengalaman_kerja_controller.dart';
import 'form_card.dart';

class PengalamanKerjaView extends GetView<PengalamanKerjaController> {
  const PengalamanKerjaView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await showBackDialog() ?? false;
        if (context.mounted && shouldPop) {
          Get.offAllNamed('/akun/pendidikan-pengalaman');
        }
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: primaryColor,
            title: const Text(
              'Form pengalaman kerja',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
                onPressed: () => Get.offAllNamed('/akun/pendidikan-pengalaman'),
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                )),
            actions: [
              IconButton(
                  onPressed: controller.addForm,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
            ],
          ),
          body: Obx(() {
            return ListView.builder(
              itemCount: controller.formData.length,
              itemBuilder: (context, index) {
                return FormCard(
                  index: index,
                  onRemove: () => controller.removeForm(index),
                );
              },
            );
          }),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity, // Mengisi lebar penuh
              child: BtnAction(
                  act: () => controller.saveProfile(),
                  color: primaryColor,
                  icon: Icons.save_as_outlined,
                  isLoading: controller.isLoading,
                  title: 'Simpan data'),
            ),
          )),
    );
  }
}
