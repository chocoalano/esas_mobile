import 'package:esas_mobile/app/modules/akun/modules/info_payroll/form/bindings/form_payroll_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_payroll/form/views/form_payroll_view.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_payroll/info/bindings/info_payroll_binding.dart';
import 'package:esas_mobile/app/modules/akun/modules/info_payroll/info/views/info_payroll_view.dart';
import 'package:esas_mobile/auth_middleware.dart';
import 'package:get/get.dart';

class InfoPayrollRoutes {
  static const path = '/akun';
  static final routes = [
    GetPage(
        name: '$path/info-payroll',
        page: () => const InfoPayrollView(),
        binding: InfoPayrollBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '$path/info-payroll/form',
        page: () => const FormPayrollView(),
        binding: FormPayrollBinding(),
        transition: Transition.noTransition,
        middlewares: [AuthMiddleware()]),
  ];
}
