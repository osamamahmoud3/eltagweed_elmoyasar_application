import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class CompetitionWebView extends StatelessWidget {
  final String url;

  const CompetitionWebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    WebViewController controller;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "امتحان التجويد الميسر",
            style: AppTextStyles.font20Weight700SecondaryColor,
          ),
          centerTitle: true),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
