import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_size.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import 'audio_play_view.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({super.key, required this.path, required this.title});
  final String path, title;

  @override
  Widget build(
    BuildContext context,
  ) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          showAppBottomSheet(
            context,
            showCloseButton: true,
            builder: (context) => AudioPlayerView(
              title: title,
              path: path,
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 13.h),
          width: double.infinity,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/Mask.png"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondaryColor),
          child: Row(
            children: [
              verticalSpace(1),
              Expanded(
                child: SizedBox(
                  child: Text(
                    title,
                    style: AppTextStyles.font20Weight700White
                        .copyWith(color: Colors.black),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              horizontalSpace(10),
              const CircleAvatar(
                backgroundColor: AppColors.thirdColor,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
