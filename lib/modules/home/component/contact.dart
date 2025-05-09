import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:savdan/controller/home/landing_controller.dart';

class ContactComponent extends StatelessWidget {
  const ContactComponent({super.key});
  static final listContactMe = [
    {
      "label": "telegram",
      "value": "+85598883435",
      "icon": "assets/images/svg/ic_telegram.svg",
      "external_link": "",
    },
    {
      "label": "linkedin",
      "value": "Soun Savdan",
      "icon": "assets/images/svg/ic_linkin.svg",
      "external_link": "",
    },
    {
      "label": "email",
      "value": "savdan@gmail.com",
      "icon": "assets/images/svg/ic_email.svg",
      "external_link": "",
      "scheme": "mailto",
    },

    {
      "label": "location",
      "value": "Phnom Penh, Cambodia",
      "icon": "assets/images/svg/ic_location.svg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final landingController = Get.find<LandingController>();
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'contact_me'.tr,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Colors.amber),
        ),
        SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listContactMe.length,
          itemBuilder: (context, i) {
            return StatefulBuilder(
              builder: (context, setState) {
                var isHovering = false.obs;

                return MouseRegion(
                  onEnter: (_) => isHovering.value = true,
                  onExit: (_) => isHovering.value = false,
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap:
                        () => landingController.launchLink(
                          url: listContactMe[i]['external_link'] ?? "",
                          scheme: listContactMe[i]['scheme'],
                        ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 10,
                            left: i != 0 ? 5 : 0,
                          ),
                          child: SvgPicture.asset(
                            ContactComponent.listContactMe[i]['icon']
                                .toString(),
                            width: i == 0 ? 30 : 25,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Flexible(
                          child: Obx(
                            () => Text(
                              ContactComponent.listContactMe[i]['value']
                                  .toString(),
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: isHovering.value ? Colors.cyan : null,

                                decorationColor: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, i) => SizedBox(height: 10),
        ),
      ],
    );
  }
}
