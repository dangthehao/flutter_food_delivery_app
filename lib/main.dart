import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app_flutter/admin/add_food.dart';
import 'package:food_delivery_app_flutter/pages/bottomnav.dart';
import 'package:food_delivery_app_flutter/pages/forgotpassword.dart';
import 'package:food_delivery_app_flutter/pages/home.dart';
import 'package:food_delivery_app_flutter/pages/login.dart';
import 'package:food_delivery_app_flutter/pages/onboard.dart';
import 'package:food_delivery_app_flutter/pages/order.dart';
import 'package:food_delivery_app_flutter/pages/profile.dart';
import 'package:food_delivery_app_flutter/pages/signup.dart';
import 'package:food_delivery_app_flutter/pages/wallet.dart';
import 'package:food_delivery_app_flutter/widget/app_constants.dart';

import 'admin/admin_login.dart';
import 'admin/home_admin.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =publishableKey;
  await Firebase.initializeApp();
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
      home: Wallet(),
    );
  }
}




