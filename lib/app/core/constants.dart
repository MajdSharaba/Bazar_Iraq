import 'package:flutter/material.dart';
import 'package:get/get.dart';


String baseUrl='http://184.168.97.161/public/api/';

double deviceHeight = Get.height;
double deviceWidth = Get.width;
int user_id=2;

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