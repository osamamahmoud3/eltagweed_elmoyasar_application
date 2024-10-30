import 'package:eltagweed_elmoyasar/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle font36Weight700White = TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Janna LT',
      color: Colors.white);
  static TextStyle font20Weight700White = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Janna LT',
      color: Colors.white);
  static TextStyle font20Weight700SecondaryColor = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Janna LT',
    color: AppColors.secondaryColor,
  );
  static TextStyle font12Weight700White = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Janna LT',
      color: Colors.white);
  static TextStyle font32Weight400SecondaryColor = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Janna LT',
      color: AppColors.secondaryColor);

  static TextStyle font16Weight400White = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font19Weight400Primary = TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Janna LT',
      color: AppColors.primaryColor);

  static TextStyle font15Weight400Grey = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    height: 1.5,
    fontFamily: 'Janna LT',
  );

  static TextStyle font15Weight400SemiBlue = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Janna LT',
      color: AppColors.semiBlue);

      static TextStyle font15Weight700Primary = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor);

  static TextStyle font16Weight400Red = TextStyle(
    color: Colors.red,
    fontSize: 16.sp,
     fontFamily: 'Janna LT',
    fontWeight: FontWeight.w400,
  );
}
