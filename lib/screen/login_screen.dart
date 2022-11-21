import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Review:Us",
                style: TextStyle(fontSize: 80.sp),
              ),
            ),
            Text(
              "for",
              style: TextStyle(fontSize: 40.sp),
            ),
            Container(
              child: Image.asset('assets/programmers.png'),
              padding: EdgeInsets.only(top: 10),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 600.w,
              child: TextField(
                decoration: InputDecoration(labelText: "Name"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 600.w,
              child: TextField(
                decoration: InputDecoration(labelText: "Password"),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(onPressed: () {}, child: Text("로그인")),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {}, child: Text("계정 등록"))
          ],
        ),
      ),
    );
  }
}
