import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:review/dialog/add_dialog.dart';
import 'package:review/models/info_model.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    final infoProvider = Provider.of<InfoProvider>(context, listen: false);

    return StreamBuilder(
        stream: reviewProvider.getReviews(),
        builder: (context, AsyncSnapshot<List<Review>> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Align(child: new CircularProgressIndicator()),
            );
          } else {
            reviewProvider.toDashboard(snapshot.data);
            reviewProvider.toWaitings(snapshot.data);
            reviewProvider.toReviews(snapshot.data);
            reviewProvider.toReflections(snapshot.data);
            return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    await infoProvider.getUserList();

                    addDialog(context);
                  },
                  child: Icon(Icons.add),
                ),
                body: Center(
                  child: ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        lg: 6,
                        md: 6,
                        xs: 6,
                        sm: 6,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/review_list");
                          },
                          child: Container(
                              height: 540.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "리뷰 하기",
                                    style: TextStyle(fontSize: 50.sp),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    reviewProvider.reviews.length.toString(),
                                    style: TextStyle(fontSize: 40.sp),
                                  )
                                ],
                              )),
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 6,
                        sm: 6,
                        md: 6,
                        xs: 6,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/reflection_list");
                          },
                          child: Container(
                              height: 540.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "반영 하기",
                                    style: TextStyle(fontSize: 50.sp),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    reviewProvider.reflections.length
                                        .toString(),
                                    style: TextStyle(fontSize: 40.sp),
                                  )
                                ],
                              )),
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 6,
                        xs: 6,
                        sm: 6,
                        md: 6,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/wating_list");
                          },
                          child: Container(
                              height: 540.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "대기 중",
                                    style: TextStyle(fontSize: 50.sp),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    reviewProvider.watings.length.toString(),
                                    style: TextStyle(fontSize: 40.sp),
                                  )
                                ],
                              )),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 6,
                        lg: 6,
                        sm: 6,
                        md: 6,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/dashboard");
                          },
                          child: Container(
                              height: 540.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "대시 보드",
                                    style: TextStyle(fontSize: 50.sp),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    reviewProvider.dashboard.length.toString(),
                                    style: TextStyle(fontSize: 40.sp),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ));
          }
        });
  }
}
