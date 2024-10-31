import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image, title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SvgPicture.asset(image),
          TextButton(
            onPressed: onTap,
            child: Text(
              title,
              style: AppTextStyles.font15Weight400Grey
                  .copyWith(color: Colors.white),
            ),
          ),
        ]),
        const Divider(
          thickness: 0.15,
          height: 10,
          color: AppColors.secondaryColor,
        ),
      ],
    );
  }
}
