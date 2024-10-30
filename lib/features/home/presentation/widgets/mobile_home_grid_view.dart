import 'package:eltagweed_elmoyasar/features/home/presentation/views/about_app.dart';
import 'package:eltagweed_elmoyasar/features/home/presentation/views/books_screen.dart';
import 'package:eltagweed_elmoyasar/features/home/presentation/views/records_screen.dart';
import 'package:eltagweed_elmoyasar/features/home/presentation/views/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_grid_view_item.dart';

class MobileHomeGridView extends StatelessWidget {
  const MobileHomeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20.w,
            crossAxisSpacing: 20.h,
            childAspectRatio: 0.7,
            crossAxisCount: 2),
        children: [
          HomeGridViewItem(
            text: 'التسجيلات الصوتية',
            image: 'assets/images/radio.png',
            onGestureTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  RecordsScreen()));
            },
          ),
          HomeGridViewItem(
            text: "الفيديوهات",
            image: 'assets/images/Play_audio.png',
            onGestureTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VideosScreen()));
            },
          ),
          HomeGridViewItem(
            text: "عن التطبيق",
            image: 'assets/images/about_app.png',
            onGestureTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutApp()));
            },
          ),
          HomeGridViewItem(
            text: "الكتاب",
            image: 'assets/images/book.png',
            onGestureTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BooksScreen()));
            },
          ),
        ]);
  }
}
