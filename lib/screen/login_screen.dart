import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:review/models/auth_model.dart';
import 'package:review/models/login_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final loginField = Provider.of<LoginFieldModel>(context, listen: false);
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
                style: TextStyle(fontSize: 60),
              ),
            ),
            Text(
              "for",
              style: TextStyle(fontSize: 40),
            ),
            Container(
              child: Image.asset(
                'assets/programmers.png',
                height: 80,
              ),
              padding: EdgeInsets.only(top: 10),
            ),
            SizedBox(
              height: 130,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                onChanged: (value) {
                  loginField.setEmail(value + '@grepp.co');
                },
                decoration: InputDecoration(labelText: "영어 이름"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 400,
              child: TextField(
                onChanged: (value) {
                  loginField.setPassword(value);
                },
                obscureText: true,
                decoration: InputDecoration(labelText: "비밀 번호"),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  authClient
                      .loginWithEmail(loginField.email, loginField.password)
                      .then((value) {
                    if (value == AuthStatus.loginSuccess) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('안녕하세요.')));
                      Navigator.of(context).pushReplacementNamed('/');
                    } else if (value == AuthStatus.verifiedFail) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text('이메일 인증을 완료해주세요.')));
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('로그인에 실패했습니다.')));
                    }
                  });
                },
                child: Text("로그인")),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("계정 등록"))
          ],
        ),
      ),
    );
  }
}
