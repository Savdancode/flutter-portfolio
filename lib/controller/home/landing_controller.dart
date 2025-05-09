import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class LandingController extends GetxController {
  final RxList<String> listMenu = ["home", "about", "services", "contact"].obs;
  final hoveredIndex = (-1).obs;
  void onHover(int index) => hoveredIndex.value = index;
  void onExit() => hoveredIndex.value = -1;

  void launchLink({required String url, String? scheme}) async {
    if (scheme == null) {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } else {
      final Uri uri = Uri(scheme: scheme, path: url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  void downloadAssetFile(String fileName) async {
    ByteData data = await rootBundle.load('assets/resume/soun_savdan.pdf');
    final buffer = data.buffer;
    final blob = html.Blob([
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    ]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor =
        html.AnchorElement(href: url)
          ..setAttribute("download", fileName)
          ..click();
    html.Url.revokeObjectUrl(url);
  }
}
