import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);

    print("[*] 로그인 상태 : " + isLogin.toString());
    if (isLogin) {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      print("[+] 저장된 정보로 로그인 재시도");
      await authClient.loginWithEmail(email!, password!).then((loginStatus) {
        if (loginStatus == AuthStatus.loginSuccess) {
          print("[+] 로그인 성공");

        } else {
          isLogin = false;
          print("[-] 로그인 실패");
          prefs.setBool(('isLogin'), false);
        }
      });
    }
    return isLogin;
  }

  moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
