import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final Function()? onTap;
  const PlayPauseButton(
      {super.key, required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: AppColors.primaryColor,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 54,
          height: 54,
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: AppColors.secondaryColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
