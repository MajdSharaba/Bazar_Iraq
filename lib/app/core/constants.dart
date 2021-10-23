import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/data/provider/db_provider/language_provider.dart';
import 'package:pazar_iraq/app/modules/controller/auth_controller.dart';


String baseUrl='http://184.168.97.161/public/api/';
final AuthController authController = Get.find();
Language? lan = new Language();



double deviceHeight = Get.height;
double deviceWidth = Get.width;
int? user_id=authController.user.value.id;
String? language= lan!.getPreferedLanguage();



LinearGradient linearGradientColor = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7200CA),Color(0xFF7200CA),Color(0xFF7200CA), Color(0xFFF75672)]);

/////pading
EdgeInsets padding =
const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
 EdgeInsets hPadding = const EdgeInsets.symmetric(
  horizontal: 10,
);