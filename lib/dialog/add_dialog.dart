import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/models/info_model.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';

void addDialog(context) {
  final infoProvider = Provider.of<InfoProvider>(context, listen: false);
  final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);
  final levels = infoProvider.levelList;
  final categorys = infoProvider.categoryList;
  final users = infoProvider.userList;
  reviewProvider.firstInspector = "";
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (__, StateSetter setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("리뷰요청"),
              ],
            ),
            contentPadding: EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "문제 제목"),
                  onChanged: (value) {
                    reviewProvider.setTitle(value);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("문제 레벨"),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                        value: reviewProvider.level.toString(),
                        items: levels
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (item) {
                          reviewProvider.setLevel(int.parse(item!));
                          setState(() {});
                        }),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("알고리즘 분류"),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                        value: reviewProvider.category,
                        items: categorys
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (item) {
                          reviewProvider.setCategory(item);
                          setState(() {});
                        }),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "문제 링크"),
                  onChanged: (value) {
                    reviewProvider.setChallengeUrl(value);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1차 검수자"),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                        hint: Text("1차 검수자"),
                        value: reviewProvider.firstInspector == ""
                            ? null
                            : reviewProvider.firstInspector,
                        items: users
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (String? item) {
                          reviewProvider.setFirstinspector(item);
                          setState(() {});
                        }),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(labelText: "1차 검수 파일"),
                  onChanged: (value) {
                    reviewProvider.setFirstinspectUrl(value);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2차 검수자"),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                        hint: Text("2차 검수자"),
                        value: reviewProvider.secondInspector == "없음"
                            ? null
                            : reviewProvider.secondInspector,
                        items: (users + ["없음"])
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (item) {
                          reviewProvider.setSecondinspector(item);
                          setState(() {});
                        }),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(labelText: "2차 검수 파일"),
                  onChanged: (value) {
                    reviewProvider.setSecondinspectUrl(value);
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (reviewProvider.firstInspector == "") return;
                    Review review = Review(
                        title: reviewProvider.title,
                        presenter: reviewProvider.presenter,
                        level: reviewProvider.level,
                        category: reviewProvider.category,
                        challengeUrl: reviewProvider.challengeUrl,
                        firstInspector: reviewProvider.firstInspector,
                        firstInspectUrl: reviewProvider.firstInspectUrl,
                        secondInspector: reviewProvider.secondInspector,
                        secondInspectUrl: reviewProvider.secondInspectUrl);
                    reviewProvider.addReview(review).then((value) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('리뷰 요청 완료.')));
                      Navigator.pop(context);
                    });
                  },
                  child: Text("완료")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("닫기"))
            ],
          );
        });
      });
}
