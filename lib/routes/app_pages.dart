import 'package:get/get.dart';
import 'package:shopsavvy_delivery_app/views/login/controllers/landing_page_controller.dart';
import 'package:shopsavvy_delivery_app/views/orders/bindings/orders_binding.dart';
import 'package:shopsavvy_delivery_app/views/orders/views/orders_view.dart';
import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import '../views/home/landing_page_binding.dart';
import '../views/login/bindings/login_binding.dart';
import '../views/login/views/login_view.dart';
import '../views/wrapper/landing_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),

    GetPage(
      name: _Paths.TABS,
      page: () => LandingPage(),
      binding: LandingPageBinding(),
    ),
  ];
}
