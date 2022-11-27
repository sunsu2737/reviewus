import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:review/dialog/dashboard_dialog%20copy.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);

    return StreamBuilder(
        stream: reviewProvider.getReviews(),
        builder: (context, AsyncSnapshot<List<Review>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Align(child: new CircularProgressIndicator()),
            );
          } else {
            reviewProvider.toDashboard(snapshot.data);
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
                        value: "출제자",
                        items: [
                          DropdownMenuItem(
                            child: Text("출제자"),
                            value: "출제자",
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
                          itemCount: reviewProvider.dashboard.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () => dashboardDialog(
                                  context, reviewProvider.dashboard[index]),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.edit_note),
                                  Text(reviewProvider
                                      .dashboard[index].presenter),
                                  Text('Lv.' +
                                      reviewProvider.dashboard[index].level
                                          .toString()),
                                  Text(
                                      reviewProvider.dashboard[index].category),
                                  SizedBox(
                                    width: 180,
                                  ),
                                  Text(
                                    reviewProvider.dashboard[index].title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 180,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
