import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/modules/controller/auth_controller.dart';
import 'package:pazar_iraq/app/modules/view/pages/homepage.dart';
import 'package:pazar_iraq/app/modules/view/widgets/bezierContainer.dart';
import 'package:pazar_iraq/app/modules/view/widgets/buttonwidget.dart';
import 'package:pazar_iraq/app/modules/view/widgets/fieldwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pinput/pin_put/pin_put.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController phoneController = TextEditingController(text: "+964");
  TextEditingController otpController = TextEditingController();
  late String _verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthController authController = Get.put(AuthController());
  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  void otpConfirm() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otpController.text,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;
      print(user!.phoneNumber);
    } catch (e) {
      print(e.toString());
    }
  }

  _dialog() async {
    authController.phoneVerification(phoneController.text);
    await Get.defaultDialog(
      contentPadding: EdgeInsets.all(16),
        title: "Confirm",
        content: PinPut(
          controller: otpController,
          eachFieldHeight: 55.0,
          selectedFieldDecoration: BoxDecoration(
            gradient: linearGradientColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          submittedFieldDecoration: BoxDecoration(
            gradient: linearGradientColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          followingFieldDecoration: BoxDecoration(
           border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(360)
          ),
          onChanged:(otp){
            if(otp.length==6){
            authController.signIn(0, otp);
            Get.to(HomePage());
            }

          },
          eachFieldWidth: 1,
          disabledDecoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(20.0),
          ),
          withCursor: true,
          fieldsCount: 6,
          pinAnimationType: PinAnimationType.scale,
          textStyle: TextStyle(color: Colors.white, fontSize: 20.0),
        ));
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );


    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  signInWithPhoneNumber() async {
    authController.phoneVerification(phoneController.text);
  }

  Widget _signinWithGoogleButton() {
    return InkWell(
      onTap: () async {
        authController.signIn(1, "");
      },
      child: Container(
        height: 60,
        width: deviceWidth,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/google_logo.png",
              fit: BoxFit.contain,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Signin With Google",
              style: TextStyle(fontSize: 19, color: Color(0xfffbb448)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signinWithFacebookButton() {
    return InkWell(
      onTap: () async {
        authController.signIn(2, "");
      },
      child: Container(
        height: 60,
        width: deviceWidth,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: const Color(0xFF1877f2),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/facebook_logo.png",
              fit: BoxFit.contain,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Signin With Facebook",
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: deviceHeight,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -deviceHeight * .15,
              right: -deviceWidth * .4,
              child: const BezierContainer()),
          Center(
            child: Container(
              width: deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: deviceHeight / 30),
                    FieldWidget(
                      title: "Phone Number",
                      controller: phoneController,
                    ),
                    SizedBox(height: deviceHeight / 30),
                    ButtonWidget(
                        title: "Signin with Phone Number", function: _dialog),
                    SizedBox(height: deviceHeight / 30),
                    _divider(),
                    SizedBox(height: deviceHeight / 30),
                    _signinWithGoogleButton(),
                    SizedBox(height: deviceHeight / 30),
                    _signinWithFacebookButton()
                  ],
                ),
              ),
            ),
          ),
          const Positioned(top: 40, left: 0, child: BackButton()),
        ],
      ),
    ));
  }
}
