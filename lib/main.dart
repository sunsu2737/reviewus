import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:review/firebase_options.dart';
import 'package:review/models/auth_model.dart';
import 'package:review/models/filter_model.dart';
import 'package:review/models/info_model.dart';
import 'package:review/models/login_model.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';
import 'package:review/screen/dashboard_screen.dart';
import 'package:review/screen/home_screen.dart';
import 'package:review/screen/login_screen.dart';
import 'package:review/screen/reflection_list_screen.dart';
import 'package:review/screen/register_screen.dart';
import 'package:review/screen/review_list_screen.dart';
import 'package:review/screen/splash_screen.dart';
import 'package:review/screen/wating_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginFieldModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(1920, 1080),
          builder: (context, child) {
            return MaterialApp(
              title: 'Review:Us',
              theme: ThemeData(
                primarySwatch: Colors.blueGrey,
              ),
              initialRoute: '/',
              routes: {
                "/login": (context) => LoginScreen(),
                '/home': (context) => HomeScreen(),
                "/review_list": (context) => ReviewListScreen(),
                "/reflection_list": (context) => ReflectionListScreen(),
                "/wating_list": (context) => WatingListScreen(),
                "/dashboard": (context) => DashboardScreen(),
                '/register': (context) => RegisterScreen(),
                '/': (context) => SplashScreen()
              },
            );
          }),
    );
  }
}
