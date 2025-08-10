import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savdan/controller/home/landing_controller.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.find<LandingController>();
    return SizedBox(
      key: key,
      child:
          screenWidth >= 600
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 300, child: _buildInfo(context, controller)),
                  SizedBox(width: 20),
                  Expanded(child: _buildPerson(screenWidth)),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildPerson(screenWidth),
                  SizedBox(height: 20),
                  _buildInfo(context, controller),
                ],
              ),
    );
  }

  Widget _buildInfo(BuildContext context, LandingController controller) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'mobile_app_developer'.tr,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.amber),
          ),
          SizedBox(height: 10),
          Text(
            "Dev Tech",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flutter", style: Theme.of(context).textTheme.displayMedium),
              SizedBox(width: 20),
              Row(
                children: [
                  Icon(Icons.location_city, size: 15),
                  SizedBox(width: 10),
                  Text(
                    "phnom_penh".tr,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              _buildArchivementItem(titel: "5 Released Apps"),
              _buildArchivementItem(titel: "3+ Years of Experience"),
              _buildArchivementItem(titel: "REST Full API"),
              _buildArchivementItem(titel: "Firebase"),
              _buildArchivementItem(titel: "GetX"),
              _buildArchivementItem(titel: "Provider"),
              _buildArchivementItem(titel: "Riverpod"),
              _buildArchivementItem(titel: "Clean Architecture"),
              _buildArchivementItem(titel: "Etc..."),
            ],
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () => controller.downloadAssetFile("soun_savdan.pdf"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(
                'download_resume'.tr,
                style: Theme.of(
                  context,
                ).elevatedButtonTheme.style?.textStyle?.resolve({}),
              ),
            ),
          ),
        ],
      );
  Widget _buildPerson(double screenWidth) => Image.asset(
    'assets/images/png/person.png',
    width: screenWidth >= 600 ? screenWidth / 2 : 300,
    fit: BoxFit.cover,
  );

  Widget _buildArchivementItem({required String titel}) => Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      titel,
      style: Get.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500),
    ),
  );
}
