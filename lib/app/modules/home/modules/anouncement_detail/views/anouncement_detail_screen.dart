import 'package:esas_mobile/components/globat_appbar.dart';
import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../controllers/anouncement_detail_controller.dart';

class AnouncementDetailScreen extends GetView<AnouncementDetailController> {
  const AnouncementDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobatAppbar(
          title: 'Detail Pengumuman',
          act: () => Get.offAllNamed('/beranda'),
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(30),
                  child: HtmlWidget(
                      controller.announcementDetail.value.value.toString()),
                ),
        ));
  }
}
