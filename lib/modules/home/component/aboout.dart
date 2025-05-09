import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:savdan/widget/custom_scroll_config.dart';

class AboutConponent extends StatelessWidget {
  const AboutConponent({super.key});
  static final listAboutItem = [
    "about_item1",
    "about_item2",
    "about_item3",
    "about_item4",
    "about_item5",
    "about_item6",
  ];
  static final listReleasedApps = [
    {
      "name": "Phum Electronics",
      "asset": "assets/images/jpg/phum_electronics.jpg",
      "app_store_url":
          "https://apps.apple.com/kh/app/phum-electronics/id1599863645",
      "play_store_url":
          "https://play.google.com/store/apps/details?id=com.bizsolution.phumelectronic&hl=en",
      "desc":
          "On Phum Electronic E-commerce Mobile App you can purchase all the product",
    },
    {
      "name": "Toys & Me",
      "asset": "assets/images/jpg/toysnme.jpg",
      "app_store_url": "https://apps.apple.com/na/app/toys-me/id1628978037",
      "play_store_url":
          "https://play.google.com/store/apps/details?id=com.bizsolution.phumelectronic&hl=en",
      "desc":
          "Toys & Me online store is more than just toys with the best prices and the most enjoyable shopping experience. It's easy to order your favorite toys on toysnme.com.kh",
    },
    {
      "name": "GGear Wholesale App",
      "asset": "assets/images/jpg/ggearwholesale.jpg",
      "app_store_url":
          "https://apps.apple.com/kh/app/ggear-wholesale-app/id6468434417",
      "play_store_url":
          "https://play.google.com/store/apps/details?id=biz.bizsolution.ggearwholesale&hl=en",
      "desc":
          "Wholesale app is the platform that can view product, set schedule, view sale target and we can order product from this application to the shop.",
    },
    {
      "name": "Phum Management Portal",
      "asset": "assets/images/jpg/management_portal.jpg",
      "app_store_url":
          "https://apps.apple.com/kh/app/phum-management/id1335493828",
      "play_store_url":
          "https://play.google.com/store/apps/details?id=com.phumdigital.schoolreport",
      "desc":
          "Phum School Report is a simple and easy way to view your school's statistics on daily fee collection, teachers, and students",
    },

    {
      "name": "Phum Association",
      "asset": "assets/images/jpg/phum_association.jpg",
      "app_store_url":
          "https://apps.apple.com/kh/app/phum-association/id6612023162",
      "play_store_url":
          "https://play.google.com/store/apps/details?id=kh.com.bizsolution.phumassociation",
      "desc":
          "Phum Association is your gateway to joining and engaging with associations effortlessly. Discover, register, and participate in events and workshops through a single, user-friendly platform. With seamless integration of ABA KHQR payment, Phum Association ensures a secure and hassle-free experience",
    },
    {
      "name": "YEAC",
      "asset": "assets/images/jpg/yeac.jpg",
      "app_store_url": "https://apps.apple.com/kh/app/yeac/id967149956",
      "play_store_url":
          "https://play.google.com/store/apps/details?id=biz.bizsolution.bic.yeac&hl=en",
      "desc":
          "The Young Entrepreneurs Association of Cambodia (YEAC) App is the platform that connects the young entrepreneurs in Cambodia to build up their business network and share experiences.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "about_me".tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.amber,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'about_me_title'.tr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.amber,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Text('about_me_desc'.tr),
            SizedBox(height: 10),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:
                  (context, i) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_box, size: 15, color: Colors.amber),
                      SizedBox(width: 10),
                      Expanded(child: Text(listAboutItem[i].tr, maxLines: 4)),
                    ],
                  ),
              separatorBuilder: (context, i) => SizedBox(height: 10),
              itemCount: listAboutItem.length,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'success_released_apps'.tr,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.amber,
                    fontSize: 17,
                  ),
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Container(height: 3, width: 70),
                //     Icon(Icons.keyboard_arrow_right_rounded, size: 30),
                //   ],
                // ),
              ],
            ),
            SizedBox(height: 10),
            CustomScrollConfig(child: _buildListProduct(screenWidth)),
          ],
        ),
      ],
    );
  }

  Widget _buildListProduct(double screenWidth) =>
      screenWidth <= 600
          ? ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) => _buildProduct(i, context, screenWidth),
            separatorBuilder: (context, i) => SizedBox(height: 10),
            itemCount: listReleasedApps.length,
          )
          : SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, i) => _buildProduct(i, context, screenWidth),
              separatorBuilder: (context, i) => SizedBox(width: 10),
              itemCount: listReleasedApps.length,
            ),
          );

  Widget _buildProduct(int i, BuildContext context, double screenWidth) =>
      Container(
        padding: EdgeInsets.all(10),
        width: 500,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).canvasColor,
        ),
      );
  Widget _actionBtn(
    BuildContext context, {
    required String title,
    required Icon icon,
    Function()? onPressed,
  }) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      maximumSize: Size(140, 40),
      minimumSize: Size(50, 40),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        SizedBox(width: 5),
        Text(
          title,
          style: Theme.of(context).elevatedButtonTheme.style?.textStyle
              ?.resolve({})
              ?.copyWith(fontSize: 16),
          textScaler: TextScaler.linear(0.8),
        ),
      ],
    ),
  );
}
