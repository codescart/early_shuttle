import 'package:flutter/material.dart';

import 'User Interface/Constant Widgets/Calender/test.dart';
import 'User Interface/Screens/Authentication/Login Page/LoginPage.dart';
import 'User Interface/Screens/Home Page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Early Shuttle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          dividerColor: Colors.transparent
      ),
      home: LoginPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

