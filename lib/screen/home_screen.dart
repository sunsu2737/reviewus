import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:review/dialog/add_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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
                            "0",
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
                            "0",
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
                    print(3);
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
                            "0",
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
                    print(4);
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
                            "0",
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
}
