import 'package:get/get.dart';
import 'package:shopsavvy_delivery_app/views/login/controllers/landing_page_controller.dart';



class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(
      () => LandingPageController(),
    );
  }
}
