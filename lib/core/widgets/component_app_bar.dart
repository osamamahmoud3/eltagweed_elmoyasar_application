import 'package:eltagweed_elmoyasar/core/styles/app_colors.dart';
import 'package:eltagweed_elmoyasar/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white.withOpacity(0.0), // No Color
        title: Text(
          'الرجوع الي الخلف',
          style: AppTextStyles.font20Weight700SecondaryColor,
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: AppColors.secondaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]);
  }
}
