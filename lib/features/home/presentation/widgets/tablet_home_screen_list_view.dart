import 'package:flutter/material.dart';

import '../views/about_app.dart';
import '../views/books_screen.dart';
import '../views/records_screen.dart';
import '../views/videos_screen.dart';
import 'home_list_view_item.dart';

class TabletHomeListView extends StatelessWidget {
  const TabletHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      HomeListViewItem(
        text: 'التسجيلات الصوتية',
        image: 'assets/images/radio.png',
        onGestureTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  RecordsScreen()));
        },
      ),
      HomeListViewItem(
        text: "الفيديوهات",
        image: 'assets/images/Play_audio.png',
        onGestureTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const VideosScreen()));
        },
      ),
      HomeListViewItem(
        text: "عن التطبيق",
        image: 'assets/images/about_app.png',
        onGestureTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AboutApp()));
        },
      ),
      HomeListViewItem(
          text: "الكتاب",
          image: 'assets/images/book.png',
          onGestureTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BooksScreen()));
          }),
    ];
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return items[index];
        });
  }
}
