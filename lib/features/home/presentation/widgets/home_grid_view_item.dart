import 'package:eltagweed_elmoyasar/core/helpers/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem(
      {super.key,
      required this.text,
      required this.image,
      required this.onGestureTap});
  final String text, image;
  final Function onGestureTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onGestureTap();
      },
      child: IntrinsicHeight(
        child: Container(
          width: 190.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondaryColor, width: 2),
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          // padding: EdgeInsets.only(right: 3.w, left: 3.w, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 190.h,
                width: 180.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                text,
                style: AppTextStyles.font20Weight700White
                    .copyWith(fontSize: 19.sp),
                //textAlign: TextAlign.end,
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
