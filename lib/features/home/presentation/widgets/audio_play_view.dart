import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/methods/audio_player_service.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import 'play_pause_button.dart';

class AudioPlayerView extends StatefulWidget {
  final String path, title;
  const AudioPlayerView({
    super.key,
    required this.path,
    required this.title,
  });

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  final audioPlayerController = AudioPlayerController();
  late final Future loadAudio;
  double? sliderTempValue;

  @override
  void initState() {
    loadAudio = audioPlayerController.loadAudio(widget.path);

    super.initState();
  }

  @override
  void dispose() {
    audioPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAudio,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
            backgroundColor: AppColors.secondaryColor,
            strokeWidth: 3,
          ));
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final audioDuration = audioPlayerController.durationInMill.toDouble();

        return StreamBuilder(
          stream: audioPlayerController.progressStream,
          builder: (context, snapshot) {
            double progress = (snapshot.data ?? 0).toDouble();

            return Column(
              children: [
                SizedBox(height: 12.h),
                Text(widget.title,
                    style: AppTextStyles.font16Weight400Red
                        .copyWith(color: AppColors.primaryColor)),
                const SizedBox(height: 10),
                Slider(
                  value: sliderTempValue ?? progress.clamp(0, audioDuration),
                  min: 0,
                  max: audioDuration,
                  onChanged: (value) {
                    setState(() {
                      sliderTempValue = value;
                    });
                  },
                  onChangeStart: (value) {
                    audioPlayerController.pause();
                  },
                  onChangeEnd: (value) {
                    audioPlayerController.seek(value.toInt());
                    sliderTempValue = null;
                    audioPlayerController.play();
                  },
                  activeColor: AppColors.primaryColor,
                ),
                Row(
                  children: [
                    PopupMenuButton<double>(
                      onSelected: (value) async {
                        await audioPlayerController.setSpeed(value);
                      },
                      itemBuilder: (context) => [
                        _buildPopupMenuItem(1.0, '1x'),
                        const PopupMenuDivider(height: 1),
                        _buildPopupMenuItem(1.25, '1.25x'),
                        const PopupMenuDivider(height: 1),
                        _buildPopupMenuItem(1.5, '1.5x'),
                        const PopupMenuDivider(height: 1),
                        _buildPopupMenuItem(1.75, '1.75x'),
                        const PopupMenuDivider(height: 1),
                        _buildPopupMenuItem(2.0, '2x'),
                      ],
                      color: AppColors.primaryColor,
                      offset: const Offset(-10, 40),
                      child: Text(
                        'Speed',
                        style: AppTextStyles.font16Weight400White
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    Text(_formatToDateTime(progress.toInt()),
                        style: AppTextStyles.font16Weight400White.copyWith(
                          color: Colors.black,
                        )),
                  ],
                ),
                const SizedBox(height: 12),
                StreamBuilder(
                  stream: audioPlayerController.playStatusStream,
                  builder: (context, snapshot) {
                    final bool isPlaying = snapshot.data ?? false;
                    return PlayPauseButton(
                      isPlaying: isPlaying,
                      onTap: () {
                        if (isPlaying) {
                          audioPlayerController.pause();
                        } else {
                          audioPlayerController.play();
                        }
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

String _formatToDateTime(int durationInMill) {
  //2000 / (1000 * 60) = 00 minutes
  final int minutes = durationInMill ~/ Duration.millisecondsPerMinute;

  //(2000 % 60000) / 1000 = 02 sec
  final int seconds = (durationInMill % Duration.millisecondsPerMinute) ~/
      Duration.millisecondsPerSecond;

  return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
}

PopupMenuItem<double> _buildPopupMenuItem(double value, String text) {
  return PopupMenuItem<double>(
    value: value,
    child: Text(
      text,
      style: AppTextStyles.font15Weight700Primary.copyWith(color: Colors.white),
    ),
  );
}
