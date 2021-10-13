import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/modules/view/pages/profile_screen.dart';
import 'package:pazar_iraq/app/modules/view/pages/welcomepage.dart';
import 'app/modules/view/pages/homepage.dart';
import 'app/modules/view/pages/signinpage.dart';

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
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
   
        primarySwatch: Colors.blue,
      ),

      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
      // home: const SigninPage(title: "welcome"),
    );
  }
}

