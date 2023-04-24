import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_exam/screens/TaskMe/provider/taskmeProvider.dart';
import 'package:practical_exam/screens/TaskMe/view/TaskmeScreen.dart';
import 'package:practical_exam/screens/api/provider/apiProvider.dart';
import 'package:practical_exam/screens/api/view/apiScreen.dart';
import 'package:practical_exam/screens/home/view/home_screen.dart';
import 'package:practical_exam/screens/login/view/loginScreen.dart';
import 'package:practical_exam/screens/signUp/view/signupScreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => taskmeProvider(),),
        ChangeNotifierProvider(create: (context) => apiProvider(),)
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (p0) => homeScreen(),
          'signin': (p0) => loginScreen(),
          'signUp': (p0) => signupScreen(),
          'taskme': (p0) => taskmeScreen(),
          'api': (p0) => apiScreen(),
        },
      ),
    ),
  );
}