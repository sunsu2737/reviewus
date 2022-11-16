import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review/screen/dashboard_screen.dart';
import 'package:review/screen/home_screen.dart';
import 'package:review/screen/login_screen.dart';
import 'package:review/screen/reflection_list_screen.dart';
import 'package:review/screen/review_list_screen.dart';
import 'package:review/screen/wating_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            initialRoute: '/',
            routes: {
              "/login": (context) => LoginScreen(),
              '/': (context) => HomeScreen(),
              "/review_list": (context) => ReviewListScreen(),
              "/reflection_list": (context) => ReflectionListScreen(),
              "/wating_list": (context) => WatingListScreen(),
              "/dashboard":(context) => DashboardScreen()
            },
          );
        });
  }
}
