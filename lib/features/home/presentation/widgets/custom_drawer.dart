import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/welcome 1.png',
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'التجويد الميسر',
                  style: AppTextStyles.font22bold,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  thickness: 0.15,
                  height: 20,
                  color: AppColors.secondaryColor,
                ),
                DrawerItem(
                  image: 'assets/svg/Frame 21.svg',
                  onTap: () async => await launch(
                      "https://wa.me/01150721902?text=السلام عليكم"),
                  title: 'تواصل معنا',
                ),
                DrawerItem(
                  image: 'assets/svg/share.svg',
                  onTap: () async => await launch(
                      "https://wa.me/01150721902?text=السلام عليكم"),
                  title: 'شارك التطبيق',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
