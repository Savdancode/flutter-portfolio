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
            itemCount: 6,
          )
          : SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, i) => _buildProduct(i, context, screenWidth),
              separatorBuilder: (context, i) => SizedBox(width: 10),
              itemCount: 6,
            ),
          );

  Widget _buildProduct(
    int i,
    BuildContext context,
    double screenWidth,
  ) => Container(
    padding: EdgeInsets.all(10),
    width: 500,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      //color: Colors.red,
    ),
    child: Row(
      children: [
        Container(
          width: screenWidth <= 600 ? 100 : 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/images/png/food_app.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food App',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.grey[600],
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 6,
              ),
            ],
          ),
        ),
      ],
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
