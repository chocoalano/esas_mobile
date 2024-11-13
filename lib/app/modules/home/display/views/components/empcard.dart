import 'package:cached_network_image/cached_network_image.dart';
import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class Empcard extends StatelessWidget {
  const Empcard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade200,
          child: Obx(
            () => (controller.img.value.isNotEmpty)
                ? ClipOval(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: CachedNetworkImage(
                        imageUrl: controller.img.value,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.grey),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        ),
        const SizedBox(width: 20), // Smaller spacing
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                    controller.nama.value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              Obx(() => Text(
                    controller.jabatan.value,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
