import 'package:flutter/material.dart';
import 'package:food_delivery_app_flutter/pages/bottomnav.dart';
import 'package:food_delivery_app_flutter/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}




