import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savdan/controller/home/landing_controller.dart';

class DrawerComponent extends StatelessWidget {
  final List item;
  final List listKey;
  final Function(GlobalKey key) scrollTo;

  const DrawerComponent({
    super.key,
    required this.item,
    required this.listKey,
    required this.scrollTo,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LandingController>();

    return Drawer(
      width: 200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20), // Small top space
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(controller.listMenu.length, (index) {
              final label = controller.listMenu[index];
              final isHovered = controller.hoveredIndex.value == index;

              return MouseRegion(
                onEnter: (_) => controller.onHover(index),
                onExit: (_) => controller.onExit(),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                    scrollTo(listKey[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Text(
                      label.tr,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: isHovered ? Colors.amber : null,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
