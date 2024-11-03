import 'dart:ui';

import 'package:eltagweed_elmoyasar/core/methods/launch_links_method.dart';
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
                  onTap: () => launchLinks(
                      'https://wa.me/201150721902?text=السلام عليكم', context),
                  title: 'تواصل معنا',
                ),
                DrawerItem(
                  image: 'assets/svg/share.svg',
                  onTap: () => shareAppLink,
                  title: 'شارك التطبيق',
                ),
                DrawerItem(
                  image: 'assets/svg/privacy-policy2.svg',
                  imageWidth: 30.w,
                  onTap: () => launchLinks(
                      'https://sites.google.com/view/tayseer-privacy-policy/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9',
                      context),
                  title: 'سياسة الخصوصية',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void shareAppLink() {
  const String appLink =
      "https://play.google.com/store/apps/details?id=com.eltagweed_elmoyasar&pcampaignid=web_share";
  const String message = "حمل الان تطبيق التجويد الميسر: $appLink";
  Share.share(message);
}
