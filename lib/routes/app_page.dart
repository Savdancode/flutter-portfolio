import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:savdan/controller/home/landing_binding.dart';
import 'package:savdan/modules/home/view/landing_view.dart';

class AppPages {
  static const initeRoute = '/';
  static final routes = [
    GetPage(name: '/', page: () => LandingView(), binding: LandingBinding()),
  ];
}
