import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';

BottomNavigationBarItem customBottomNavBarIcon(
    {required String icon, required String label}) {
  return BottomNavigationBarItem(
    activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.thirdColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          icon,
          color: Colors.white,
        )),
    icon: SvgPicture.asset(
      icon,
      color: Colors.black,
      height: 28.h,
    ),
    label: label,
  );
}
