import 'package:eltagweed_elmoyasar/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.15,
      height: 10,
      color: AppColors.secondaryColor,
    );
  }
}
