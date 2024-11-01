import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchLinks(String link, BuildContext context) async {
  if (!await launchUrl(Uri.parse(link))) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('لا يمكن فتح الرابط, حاول لاحقاً'),
      ),
    );
  }
}
