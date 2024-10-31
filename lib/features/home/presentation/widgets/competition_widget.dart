import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class CompetitionWidget extends StatelessWidget {
  const CompetitionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/Star 5.svg'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.secondaryColor, width: 1)),
          child: Text('مسابقة التجويد الميسر',
              style: AppTextStyles.font20Weight700SecondaryColor
                  .copyWith(color: Colors.white.withOpacity(0.5))),
        ),
        SvgPicture.asset('assets/svg/Star 5.svg'),
      ],
    );
  }
}