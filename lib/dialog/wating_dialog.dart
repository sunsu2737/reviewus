import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void watingDialog(context, review) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Text(review[9]),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              new Text(review[0]),
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
                    "제작: " + review[2],
                  ),
                  Text(
                    "레벨: " + review[3],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "분류: " + review[4],
              ),
              SizedBox(
                height: 15,
              ),
              Linkify(
                onOpen: (link) async {
                  launchUrl(Uri.parse(link.url));
                },
                text: "문제 링크: " + review[1],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "1차 검수자: " + review[5],
              ),
              Linkify(
                onOpen: (link) async {
                  launchUrl(Uri.parse(link.url));
                },
                text: "1차 검수 파일: " + review[6],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "2차 검수자: " + review[7],
              ),
              Linkify(
                onOpen: (link) async {
                  launchUrl(Uri.parse(link.url));
                },
                text: "2차 검수 파일: " + review[8],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("닫기"))
          ],
        );
      });
}
