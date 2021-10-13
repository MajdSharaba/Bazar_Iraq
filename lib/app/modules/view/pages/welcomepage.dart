import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/view/pages/homepage.dart';
import 'package:pazar_iraq/app/modules/view/widgets/borderedbutton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key,  this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {





  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(


          children: [
            TextSpan(
              text: 'IQ',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'pazar',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Stack(
          children: [

            Image.asset("assets/header.png"),
            /*
            ClipPath(
              clipper: DiagonalPathClipperOne(),
              child: Container(
                height: 150,
                color: Color(0xFF9B55C8),
              ),
            ),
            ClipPath(
              clipper: DiagonalPathClipperOne(),
              child: Container(
                height: 120,
                color: Color(0xFF7200CA),
              ),
            ),
            */

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: deviceHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 0,
                  ),
                  Image.asset("assets/logo.png"),

                  BorderedButton(buttonText: "English", function: (){
                    Get.to(HomePage());
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  BorderedButton(buttonText: "عربي", function: (){
                    print("dd");
                  }),
                  const SizedBox(
                    height: 10,
                  ),

                  BorderedButton(buttonText: "كورد", function: (){
                    print("dd");
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                  Text("Powered By Yawar",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}