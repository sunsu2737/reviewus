import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review/dialog/review_dialog.dart';

class ReviewListScreen extends StatelessWidget {
  const ReviewListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> reviews = [
      [
        "사과따기",
        "https://google.com",
        "Brady",
        "2",
        "Greedy",
        "Louis",
        "https://naver.com",
        "Jaron",
        "",
        "1차 진행중"
      ],
      [
        "사과따기",
        "https://google.com",
        "Brady",
        "2",
        "Greedy",
        "Louis",
        "https://naver.com",
        "Jaron",
        "",
        "2차 진행중"
      ],
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("리뷰 목록"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => reviewDialog(context, reviews[index]),
                title: Text(
                  reviews[index][0],
                  textAlign: TextAlign.center,
                ),
                trailing: Text(reviews[index][2]),
              );
            },
          ),
        ),
      ),
    );
  }
}
