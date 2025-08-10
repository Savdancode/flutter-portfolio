import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savdan/controller/app/app_controller.dart';
import 'package:savdan/lang/translations.dart';
import 'package:savdan/routes/app_page.dart';
import 'package:savdan/theme/theme.dart';

void main() {
  Get.put(AppController(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dev Tech',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: appController.theme,
        initialRoute: AppPages.initeRoute,

        getPages: AppPages.routes,
        translations: AppTranslations(), // ✅ Load translations
        locale: appController.currentLocale.value, // ✅ Default locale
        fallbackLocale: const Locale('en', 'US'),
      ),
    );
  }
}
