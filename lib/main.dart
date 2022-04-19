import 'package:flutter/material.dart';

import '../styles/theme.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';
import 'routes/routes.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DokkanTek',
      debugShowCheckedModeBanner: false,
      theme: DokkanTekTheme.getThemeData(context),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/": (ctx) => const LoginView(),
        Routes.login: (context) => const LoginView(),
        Routes.signup: (context) => const SignupView(),
        Routes.home: (context) => const HomeView(),
      },
    );
  }
}
