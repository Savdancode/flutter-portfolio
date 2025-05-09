import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ServiceCompenent extends StatelessWidget {
  const ServiceCompenent({super.key});
  static final listService = [
    {
      "title": "Custom Mobile App Development",
      "description":
          "<ul><li>Cross-platform apps using Flutter for iOS and Android.</li><li>Focus on business apps, e-commerce, and service-based apps.</li></ul>",
    },
    {
      "title": "UI/UX Design Integration",
      "description":
          "<ul><li>Pixel-perfect UI based on Figma/Sketch/Adobe XD.</li><li>Responsive layouts and adaptive designs for tablets and phones.</li></ul>",
    },
    {
      "title": "App Maintenance & Updates",
      "description":
          "<ul><li>Ongoing support for bug fixes, feature updates, and OS compatibility.</li><li>Firebase crash monitoring & hotfixes.</li></ul>",
    },
    {
      "title": "State Management Solutions",
      "description":
          "<ul><li>Using GetX, Provider, or Riverpod based on project size and complexity.</li><li>Architecture consultation for best practices.</li></ul>",
    },
    {
      "title": "Firebase Integration",
      "description":
          "<ul><li>Authentication, Firestore, Realtime Database, Push Notifications, Analytics.</li></ul>",
    },
    {
      "title": "API Integration & Backend Connectivity",
      "description":
          "<ul><li>RESTful API integration.</li><li>GraphQL setup (if applicable).</li></ul>",
    },
    {
      "title": "App Store & Play Store Deployment",
      "description":
          "<ul><li>End-to-end deployment support.</li><li>Help with Play Console, App Store Connect, ASO basics.</li></ul>",
    },
    {
      "title": "E-Commerce Mobile App",
      "description":
          "<ul><li>Ready-made template or custom development for online stores.</li><li>Features: product listing, cart, payments, and order tracking.</li></ul>",
    },
    {
      "title": "Code Refactoring & Optimization",
      "description":
          "<ul><li>Clean Architecture setup.</li><li>Modular codebase for scalability and maintainability.</li></ul>",
    },
    {
      "title": "Consulting & Training",
      "description":
          "<ul><li>One-on-one or team training in Flutter, Dart, GetX/Provider, or Clean Architecture principles.</li><li>App code reviews and architecture audits.</li></ul>",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'services'.tr,
          textAlign: TextAlign.start,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Colors.amber, fontSize: 17),
        ),
        SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, i) => SizedBox(height: 5),
          physics: NeverScrollableScrollPhysics(),
          itemCount: listService.length,
          itemBuilder: (context, index) {
            final service = listService[index];
            return Card(
              elevation: 1,
              margin: EdgeInsets.all(8),
              color: Theme.of(context).canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service["title"] ?? "",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    HtmlWidget(service["description"] ?? ""),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
