import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/modules/view/pages/welcomepage.dart';

import 'app/modules/controller/auth_controller.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    authController.getUser();

    return GetMaterialApp(
      title: 'Iraq Bazar',
      theme: ThemeData(
        // This is the theme of your application.
      ),

      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
      // home: const SigninPage(title: "welcome"),
    );
  }
}

