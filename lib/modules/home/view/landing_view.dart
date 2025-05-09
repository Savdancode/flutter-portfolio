import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:savdan/controller/home/landing_controller.dart';
import 'package:savdan/controller/app/app_controller.dart';
import 'package:savdan/modules/home/component/aboout.dart';
import 'package:savdan/modules/home/component/contact.dart';
import 'package:savdan/modules/home/component/drawer.dart';
import 'package:savdan/modules/home/component/home.dart';
import 'package:savdan/modules/home/component/service.dart';
import 'package:savdan/widget/custom_scroll_config.dart';
import 'package:savdan/widget/responsive_widget.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});
  static final listKey = [GlobalKey(), GlobalKey(), GlobalKey(), GlobalKey()];
  static final ScrollController _scrollController = ScrollController();
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LandingController>();
    final appController = Get.find<AppController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        //title: const Text("Landing Page"),
        actions: [
          screenWidth >= 900
              ? Obx(
                () => Row(
                  children: List.generate(controller.listMenu.length, (index) {
                    final label = controller.listMenu[index];
                    final isHovered = controller.hoveredIndex.value == index;

                    return MouseRegion(
                      onEnter: (_) => controller.onHover(index),
                      onExit: (_) => controller.onExit(),
                      child: GestureDetector(
                        onTap: () => scrollTo(listKey[index]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            label.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall!.copyWith(
                              color: isHovered ? Colors.amber : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
              : SizedBox(),
          IconButton(
            onPressed: () {
              if (appController.currentLocale.value.languageCode == "en") {
                appController.changeLanguage('km', "KH");
              } else {
                appController.changeLanguage('en', "US");
              }
            },
            icon: SvgPicture.asset('assets/images/svg/ic_lang.svg', width: 25),
          ),
          Obx(
            () => IconButton(
              onPressed: appController.toggleTheme,
              icon: Icon(
                appController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              tooltip: "Switch Theme",
            ),
          ),
          SizedBox(
            width: screenWidth / 11,
            child:
                screenWidth <= 900
                    ? IconButton(
                      onPressed:
                          () => _scaffoldKey.currentState?.openEndDrawer(),
                      icon: Icon(Icons.menu),
                    )
                    : null,
          ),
        ],
      ),
      endDrawer: DrawerComponent(
        item: controller.listMenu,
        listKey: listKey,
        scrollTo: scrollTo,
      ),
      body: CustomScrollConfig(
        child: ListView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          children: [
            ResponsiveWidget(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 20),
                  _scrollToWidget(key: listKey[0], child: HomeComponent()),
                  SizedBox(height: 10),
                  _scrollToWidget(key: listKey[1], child: AboutConponent()),

                  SizedBox(height: 10),
                  _scrollToWidget(key: listKey[2], child: ServiceCompenent()),

                  SizedBox(height: 10),
                  _scrollToWidget(key: listKey[3], child: ContactComponent()),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Theme.of(context).canvasColor,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("@ 2024 Savdan"),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  Text("${'develop_by'.tr} ${"soun_savdan".tr}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _scrollToWidget({required GlobalKey key, required Widget child}) =>
      SizedBox(key: key, child: child);
}
