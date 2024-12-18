import 'dart:ui';

import 'package:eltagweed_elmoyasar/core/helpers/constants.dart';
import 'package:eltagweed_elmoyasar/core/methods/launch_links_method.dart';
import 'package:eltagweed_elmoyasar/core/methods/share_app_link.dart';
import 'package:eltagweed_elmoyasar/core/styles/app_colors.dart';
import 'package:eltagweed_elmoyasar/core/styles/app_text_styles.dart';
import 'package:eltagweed_elmoyasar/core/widgets/drawer_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

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
                const DrawerDivider(),
                DrawerItem(
                  image: 'assets/svg/Frame 21.svg',
                  onTap: () => launchLinks(contactUsLink, context),
                  title: 'تواصل معنا',
                ),
                DrawerItem(
                  image: 'assets/svg/share.svg',
                  onTap: () => shareAppLink,
                  title: 'شارك التطبيق',
                  isCustomImage: true,
                  imageWidth: 20.w,
                  imageColor: AppColors.secondaryColor,
                ),
                DrawerItem(
                  image: 'assets/svg/privacy-policy2.svg',
                  isCustomImage: true,
                  imageColor: AppColors.secondaryColor,
                  imageWidth: 30.w,
                  onTap: () => launchLinks(privacyPolicyLink, context),
                  title: 'سياسة الخصوصية',
                ),
                Banner(
                  message: "%خصم 50 ",
                  location: BannerLocation.topEnd,
                  color: Colors.grey.withOpacity(0),
                  textStyle: AppTextStyles.font16Weight400White.copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  child: DrawerItem(
                    image: 'assets/svg/buy-book3.svg',
                    isCustomImage: true,
                    imageColor: AppColors.secondaryColor,
                    onTap: () => launchLinks(buyTheBookLink, context),
                    title: 'اطلب الكتاب',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
