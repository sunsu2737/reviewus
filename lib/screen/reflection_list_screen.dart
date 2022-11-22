import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review/dialog/review_dialog.dart';

class ReflectionListScreen extends StatelessWidget {
  const ReflectionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("리뷰 반영"),
    //     centerTitle: true,
    //   ),
    //   body: Center(
    //     child: Container(
    //       width: 500,
    //       child: ListView.builder(
    //         itemCount: reviews.length,
    //         itemBuilder: (context, index) {
    //           return ListTile(
    //             onTap: () => reviewDialog(context, reviews),
    //             title: Text(
    //               reviews[index][0],
    //               textAlign: TextAlign.center,
    //             ),
    //             trailing: Text(reviews[index][2]),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
