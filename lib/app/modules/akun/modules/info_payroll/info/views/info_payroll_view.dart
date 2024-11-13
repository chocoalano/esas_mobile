import 'package:card_loading/card_loading.dart';
import 'package:esas_mobile/components/globat_appbar.dart';
import 'package:esas_mobile/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:u_credit_card/u_credit_card.dart';

import '../controllers/info_payroll_controller.dart';

class InfoPayrollView extends GetView<InfoPayrollController> {
  const InfoPayrollView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        Get.offAllNamed('/akun');
      },
      child: Scaffold(
        appBar: GlobatAppbar(
          title: 'Info payroll',
          act: () => Get.offAllNamed('/akun'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildAttendanceInfo(controller)],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceInfo(InfoPayrollController controller) {
    return Obx(() {
      final data = controller.accountModel.value;
      if (controller.isloading.isFalse) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CreditCardUi(
                cardHolderFullName: data.account!.bank!.bankAccountHolder!,
                cardNumber: '',
                validFrom: '00/00',
                validThru: '00/00',
                topLeftColor: primaryColor,
                cardProviderLogo: Image.asset('assets/images/sas-logo.png'),
                cardProviderLogoPosition: CardProviderLogoPosition.right,
                enableFlipping: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Informasi Bank',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () => Get.offAllNamed('/akun/info-payroll/form'),
                    child: const Text(
                      'Perbaharui bank',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data bank',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildInfoRow('Nama bank', data.account!.bank!.bankName),
                  _buildInfoRow(
                      'No. Rekening', data.account!.bank!.bankAccount),
                  _buildInfoRow(
                      'An. Bank', data.account!.bank!.bankAccountHolder),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data payroll',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildInfoRow(
                      'Gaji pokok',
                      formatRupiah(
                          data.account!.salary!.basicSalary.toDouble())),
                  _buildInfoRow('Tipe waktu pembayaran',
                      data.account!.salary!.salaryType),
                  _buildInfoRow('Jadwal pembayaran',
                      data.account!.salary!.paymentSchedule),
                  _buildInfoRow('Aturan pembayaran lembur',
                      data.account!.salary!.overtimeSettings),
                  _buildInfoRow(
                      'Mata uang pembayaran', data.account!.salary!.currency),
                ],
              ),
            ),
          ],
        );
      } else {
        return const CardLoading(
          height: 100,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          margin: EdgeInsets.only(bottom: 10),
        );
      }
    });
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: _labelStyle()),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.grey[600],
    );
  }

  String formatRupiah(double amount) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID', // Locale untuk Indonesia
      symbol: 'Rp', // Simbol mata uang
      decimalDigits: 0, // Jumlah digit desimal
    );
    return formatter.format(amount);
  }
}
