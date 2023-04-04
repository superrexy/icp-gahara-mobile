import 'package:get/get.dart';
import 'package:icp_gahara_mobile/app/modules/rent_car/views/detail_payment_view.dart';

import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/form_location_view.dart';
import '../modules/location/views/location_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/detail_order_view.dart';
import '../modules/order/views/order_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/rent_car/bindings/rent_car_binding.dart';
import '../modules/rent_car/views/detail_rent_car_view.dart';
import '../modules/rent_car/views/form_car_view.dart';
import '../modules/rent_car/views/form_detail_rent_car_view.dart';
import '../modules/rent_car/views/form_rent_car_view.dart';
import '../modules/rent_car/views/rent_car_view.dart';
import '../modules/rent_car/views/choose_payment_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../views/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RENT_CAR,
      page: () => const RentCarView(),
      binding: RentCarBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RENT_CAR,
      page: () => const DetailRentCarView(),
      binding: RentCarBinding(),
    ),
    GetPage(
      name: _Paths.FORM_RENT_CAR,
      page: () => const FormRentCarView(),
      binding: RentCarBinding(),
    ),
    GetPage(
      name: _Paths.FORM_CAR,
      page: () => const FormCarView(),
      binding: RentCarBinding(),
    ),
    GetPage(
      name: _Paths.FORM_DETAIL_RENT_CAR,
      page: () => const FormDetailRentCarView(),
      binding: RentCarBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.FORM_LOCATION,
      page: () => const FormLocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => const SuccessView(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ORDER,
      page: () => const DetailOrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_PAYMENT,
      page: () => const ChoosePaymentView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PAYMENT,
      page: () => const DetailPaymentView(),
      binding: RentCarBinding(),
    ),
  ];
}
