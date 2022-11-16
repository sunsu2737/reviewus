import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void addDialog(context) {
  final _valueList = ['첫번째', '두번쩨', '세번째'];
  String? _selectValue = '첫번째';
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                      value: "0",
                      items: [
                        DropdownMenuItem(
                          child: Text("0"),
                          value: "0",
                        ),
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text("4"),
                          value: "4",
                        ),
                        DropdownMenuItem(
                          child: Text("5"),
                          value: "5",
                        ),
                      ],
                      onChanged: (item) {}),
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
                      value: "0",
                      items: [
                        DropdownMenuItem(
                          child: Text("0"),
                          value: "0",
                        ),
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text("4"),
                          value: "4",
                        ),
                        DropdownMenuItem(
                          child: Text("5"),
                          value: "5",
                        ),
                      ],
                      onChanged: (item) {}),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(labelText: "문제 링크"),
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
                      value: "0",
                      items: [
                        DropdownMenuItem(
                          child: Text("0"),
                          value: "0",
                        ),
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text("4"),
                          value: "4",
                        ),
                        DropdownMenuItem(
                          child: Text("5"),
                          value: "5",
                        ),
                      ],
                      onChanged: (item) {}),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: "1차 검수 파일"),
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
                      value: "0",
                      items: [
                        DropdownMenuItem(
                          child: Text("0"),
                          value: "0",
                        ),
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("3"),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text("4"),
                          value: "4",
                        ),
                        DropdownMenuItem(
                          child: Text("5"),
                          value: "5",
                        ),
                      ],
                      onChanged: (item) {}),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: "2차 검수 파일"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
