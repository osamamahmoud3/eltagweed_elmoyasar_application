import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class RecordsOrFavoriteItem extends StatelessWidget {
  const RecordsOrFavoriteItem(
      {super.key, required this.selectedItem, required this.text, this.onTap});
  final bool selectedItem;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: selectedItem ? AppColors.secondaryColor : AppColors.blackColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(text,
              style: selectedItem
                  ? AppTextStyles.font16Weight400White
                      .copyWith(color: Colors.black)
                  : AppTextStyles.font16Weight400White),
        ),
      ),
    );
  }
}
