import 'package:flutter/material.dart';
import 'package:review/dialog/wating_dialog.dart';

class WatingListScreen extends StatelessWidget {
  const WatingListScreen({Key? key}) : super(key: key);

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
        title: Text("요청한 리뷰"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () => watingDialog(context, reviews[index]),
                  title: Text(
                    reviews[index][0],
                    textAlign: TextAlign.center,
                  ),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)));
            },
          ),
        ),
      ),
    );
  }
}
