import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eltagweed_elmoyasar/features/home/presentation/widgets/exam_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/methods/get_device_indentifier.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import 'competition_widget.dart';

class CompetitionAnnouncement extends StatefulWidget {
  const CompetitionAnnouncement({super.key});

  @override
  State<StatefulWidget> createState() => _CompetitionAnnouncementState();
}

class _CompetitionAnnouncementState extends State<CompetitionAnnouncement> {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool hasViewedExam = false;
  late String deviceId;

  @override
  void initState() {
    super.initState();
    initializeDeviceId();
  }

  Future<void> initializeDeviceId() async {
    deviceId = await getDeviceIdentifier();
    await checkExamStatus();
  }

  Future<void> checkExamStatus() async {
    DocumentSnapshot doc =
        await firestore.collection('exam_views').doc(deviceId).get();

    hasViewedExam =
        doc.exists && (doc.data() as Map<String, dynamic>)['viewed'] == true;

    Future.delayed(const Duration(seconds: 30), () async {
      await firestore
          .collection('exam_views')
          .doc(deviceId)
          .set({'viewed': false});
      if (mounted) {
        setState(() {
          hasViewedExam = false;
        });
      }
    });
  }

  Future<void> markExamAsViewed() async {
    await firestore
        .collection('exam_views')
        .doc(deviceId)
        .set({'viewed': true}, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: firestore.collection('exams').doc('current_exam').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
              strokeWidth: 3,
            ));
          }

          if (snapshot.hasData && snapshot.data?.exists == true) {
            var examData = snapshot.data;
            var link = examData?.get('link') ?? '';

            if (link.isNotEmpty && !hasViewedExam) {
              return CompetitionWidget(
                isCompetition: true,
                onTap: () async {
                  print(link);
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompetitionWebView(url: link),
                    ),
                  ).then((_) async {
                    setState(() {
                      hasViewedExam = true;
                    });
                  });
                  await markExamAsViewed();
                  await checkExamStatus();
                },
              );
            } else {
              return Column(children: [
                Text(
                    hasViewedExam && link.isNotEmpty
                        ? 'لا يمكن الدخول للامتحان مره اخري '
                        : 'المسابقة ليست متاحة الان',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font12redNormal),
                SizedBox(height: 5.h),
                CompetitionWidget(
                  isCompetition: false,
                  onTap: () {},
                )
              ]);
            }
          } else {
            return const SizedBox();
          }
        });
  }
}
