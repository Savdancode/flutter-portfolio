import 'package:get/get.dart';
import 'package:savdan/controller/home/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController());
  }
}
