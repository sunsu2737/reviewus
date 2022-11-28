import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:review/dialog/dashboard_dialog%20copy.dart';
import 'package:review/models/filter_model.dart';
import 'package:review/models/info_model.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    final infoProvider = Provider.of<InfoProvider>(context, listen: false);
    final filterProvider = Provider.of<FilterProvider>(context);
    return StreamBuilder(
        stream: reviewProvider.getReviews(),
        builder: (context, AsyncSnapshot<List<Review>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Align(child: new CircularProgressIndicator()),
            );
          } else {
            reviewProvider.toDashboard(
                data: snapshot.data!,
                sstate: filterProvider.state,
                scategory: filterProvider.category,
                sfirst: filterProvider.first,
                slevel: filterProvider.level,
                spresenter: filterProvider.presenter,
                ssecond: filterProvider.second);
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
                        value: filterProvider.state == "전체"
                            ? null
                            : filterProvider.state,
                        hint: Text("상태"),
                        items: (["전체"] + infoProvider.stateList)
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          filterProvider.selectState(value!);
                        },
                      ),
                      DropdownButton(
                        value: filterProvider.presenter == "전체"
                            ? null
                            : filterProvider.presenter,
                        hint: Text("출제자"),
                        items: (["전체"] + infoProvider.userList)
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          filterProvider.selectPresenter(value!);
                        },
                      ),
                      DropdownButton(
                        value: filterProvider.level == "전체"
                            ? null
                            : filterProvider.level,
                        hint: Text("레벨"),
                        items: (["전체"] + infoProvider.levelList)
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          filterProvider.selectLevel(value!);
                        },
                      ),
                      DropdownButton(
                        value: filterProvider.category == "전체"
                            ? null
                            : filterProvider.category,
                        hint: Text("분류"),
                        items: (["전체"] + infoProvider.categoryList)
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          filterProvider.selectCategory(value!);
                        },
                      ),
                      DropdownButton(
                        value: filterProvider.first == "전체"
                            ? null
                            : filterProvider.first,
                        hint: Text("1차 검수자"),
                        items: (["전체"] + infoProvider.userList)
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          filterProvider.selectFirst(value!);
                        },
                      ),
                      DropdownButton(
                        value: filterProvider.second == "전체"
                            ? null
                            : filterProvider.second,
                        hint: Text("2차 검수자"),
                        items: (["전체"] + infoProvider.userList + ["없음"])
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          filterProvider.selectSecond(value!);
                        },
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
                                  SizedBox(
                                      width: 100,
                                      child: Text(
                                        reviewProvider.dashboard[index].state,
                                      )),
                                  SizedBox(
                                    width: 100,
                                    child: Text(reviewProvider
                                        .dashboard[index].presenter),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text('Lv.' +
                                        reviewProvider.dashboard[index].level
                                            .toString()),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(reviewProvider
                                        .dashboard[index].category),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    child: Text(
                                      reviewProvider.dashboard[index].title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
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
