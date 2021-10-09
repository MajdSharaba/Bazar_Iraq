import 'package:flutter/material.dart';
import 'package:get/get.dart';


String baseUrl='http://184.168.97.161/public/api/';

double deviceHeight = Get.height;
double deviceWidth = Get.width;

LinearGradient linearGradientColor = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xfffbb448), Color(0xfff7892b)]);

/////pading
EdgeInsets padding =
const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
 EdgeInsets hPadding = const EdgeInsets.symmetric(
  horizontal: 10,
);