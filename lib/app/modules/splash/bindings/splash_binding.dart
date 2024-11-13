import 'package:esas_mobile/app/networks/api/akun/api_auth.dart';
import 'package:esas_mobile/services/storage.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    Get.lazyPut<Storage>(
      () => Storage(),
    );
    Get.lazyPut<ApiAuth>(
      () => ApiAuth(),
    );
  }
}
