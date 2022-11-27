import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:review/dialog/complete_dialog.dart';
import 'package:review/models/review_model.dart';
import 'package:url_launcher/url_launcher.dart';

void reviewDialog(context, Review review) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Text(review.state),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              new Text(review.title),
            ],
          ),
          contentPadding: EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "출제: " + review.presenter,
                  ),
                  Text(
                    "레벨: " + review.level.toString(),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "분류: " + review.category,
              ),
              SizedBox(
                height: 15,
              ),
              Linkify(
                onOpen: (link) async {
                  launchUrl(Uri.parse(link.url));
                },
                text: "문제 링크: " + review.challengeUrl,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "1차 검수자: " + review.firstInspector,
              ),
              Linkify(
                onOpen: (link) async {
                  launchUrl(Uri.parse(link.url));
                },
                text: "1차 검수 파일: " + review.firstInspectUrl,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "2차 검수자: " + review.secondInspector,
              ),
              Linkify(
                onOpen: (link) async {
                  launchUrl(Uri.parse(link.url));
                },
                text: "2차 검수 파일: " + review.secondInspectUrl,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  completeDialog(context, review.id!, review.state);
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
}
