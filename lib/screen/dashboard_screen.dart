import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review/dialog/wating_dialog.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
        title: Text("대시 보드"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                value: "상태",
                items: [
                  DropdownMenuItem(
                    child: Text("상태"),
                    value: "상태",
                  ),
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
                ],
                onChanged: (value) {},
              ),
              DropdownButton(
                value: "작성자",
                items: [
                  DropdownMenuItem(
                    child: Text("작성자"),
                    value: "작성자",
                  ),
                  DropdownMenuItem(
                    child: Text("Brady"),
                    value: "Brady",
                  ),
                  DropdownMenuItem(
                    child: Text("Jaron"),
                    value: "Jaron",
                  ),
                  DropdownMenuItem(
                    child: Text("Marble"),
                    value: "Marble",
                  ),
                ],
                onChanged: (value) {},
              ),
              DropdownButton(
                value: "레벨",
                items: [
                  DropdownMenuItem(
                    child: Text("레벨"),
                    value: "레벨",
                  ),
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
                ],
                onChanged: (value) {},
              ),
              DropdownButton(
                value: "분류",
                items: [
                  DropdownMenuItem(
                    child: Text("분류"),
                    value: "분류",
                  ),
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
                ],
                onChanged: (value) {},
              ),
              DropdownButton(
                value: "1차 검수자",
                items: [
                  DropdownMenuItem(
                    child: Text("1차 검수자"),
                    value: "1차 검수자",
                  ),
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
                ],
                onChanged: (value) {},
              ),
              DropdownButton(
                value: "2차 검수자",
                items: [
                  DropdownMenuItem(
                    child: Text("2차 검수자"),
                    value: "2차 검수자",
                  ),
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
                ],
                onChanged: (value) {},
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            color: Colors.grey,
            height: 0.5,
            width: 1600.w,
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 1000,
                child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () => watingDialog(context, reviews[index]),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 180,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.edit_note),
                                  Text(reviews[0][2]),
                                  Text(reviews[0][3]),
                                  Text(reviews[0][4]),
                                ],
                              ),
                            ),
                            Text(
                              reviews[index][0],
                            ),
                            SizedBox(
                              width: 180,
                            )
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete)));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
