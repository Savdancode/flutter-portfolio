import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool isDarkMode = false.obs;
  Rx<Locale> currentLocale = const Locale('en', 'US').obs;

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(theme);
    update();
  }

  void changeLanguage(String languageCode, String countryCode) {
    final locale = Locale(languageCode, countryCode);
    currentLocale.value = locale;
    Get.updateLocale(locale);
    update();
  }
}
