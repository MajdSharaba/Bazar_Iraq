import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pazar_iraq/app/core/constants.dart';
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
        child:Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: deviceHeight,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              const SizedBox(
                height: 80,
              ),

              const SizedBox(
                height: 20,
              ),
              BorderedButton(buttonText: "English", function: (){
                print("dd");
              }),
              const SizedBox(
                height: 20,
              ),
              BorderedButton(buttonText: "عربي", function: (){
                print("dd");
              }),
              const SizedBox(
                height: 20,
              ),

              BorderedButton(buttonText: "كورد", function: (){
                print("dd");
              })

            ],
          ),
        ),
      ),
    );
  }
}