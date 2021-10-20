import 'package:get/get.dart';
import 'package:pazar_iraq/app/core/constants.dart';

void showSnackBar(String message){
  Get.snackbar("Bazar Iraq", message,backgroundGradient: linearGradientColor,);
}