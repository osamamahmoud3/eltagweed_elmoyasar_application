import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class CompetitionWidget extends StatelessWidget {
  const CompetitionWidget({
    super.key, required this.isCompetition, required this.onTap,
  });
  final bool isCompetition ;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCompetition ? onTap : null,
      child: Row(
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
                    .copyWith(color: Colors.white.withOpacity( isCompetition ? 1 : 0.5))),
          ),
          SvgPicture.asset('assets/svg/Star 5.svg'),
        ],
      ),
    );
  }
}
