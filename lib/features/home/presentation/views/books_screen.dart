import 'package:eltagweed_elmoyasar/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/styles/app_text_styles.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor, // No Color
          title: Text(
            'التجويد الميسر',
            style: AppTextStyles.font20Weight700SecondaryColor,
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: const SizedBox(),
          actions: const [
            SizedBox(),
          ],
        ),
        body: SafeArea(
          child: SfPdfViewer.asset(
            'assets/pdf/التجويد الميسر.pdf',
          ),
        ));
  }
}
