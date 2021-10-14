import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:pazar_iraq/app/core/constants.dart';
import 'package:pazar_iraq/app/model/user.dart';

String _verificationId = "";

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late AuthCredential credential;
  late UserCredential userCredential;
  Future<UserModel> signIn(int signInTypeId, String otp) async {
    switch (signInTypeId) {
      case 0:
        userCredential = await otpConfirm(otp);
        break;
      case 1:
        userCredential = await signInWithGoogle();
        break;
      case 2:
        userCredential = await signInWithFacebook();
        break;
    }
    var user=await getCurrentUser();
    return user ;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential
    credential = GoogleAuthProvider.credential(
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

  signInWithPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        print(_verificationId);
        // Create a PhoneAuthCredential with the code
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<UserCredential> otpConfirm(String otp) async {
    credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    return await _auth.signInWithCredential(credential);
  }

  getCurrentUser() async {
    String? token = await _auth.currentUser!.getIdToken();
    var response = await http.post(
      Uri.parse(baseUrl + "firebaselogin"),
      body: jsonEncode({"firebasetoken": token}),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    return UserModel.fromJson(jsonDecode(response.body));
  }
}
