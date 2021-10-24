import 'package:comment_box/main.dart';
import 'package:get/get.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/auth_provider.dart';
import 'package:pazar_iraq/app/data/provider/db_provider/auth_provider.dart';
import 'package:pazar_iraq/app/model/user.dart';

import 'package:pazar_iraq/app/modules/view/pages/homepage.dart';

class AuthController extends GetxController {
  var isLoading=false.obs;
  Rx<UserModel> user = UserModel().obs;


  signIn(int signInTypeId,String otp) async {
  user.value=await Auth().signIn(signInTypeId, otp);
  await AccessTokenStorage().saveAccessToken(user.value.accessToken!);
  Get.back();
  }

  phoneVerification(String phoneNumber) async {
    await Auth().signInWithPhoneNumber(phoneNumber);
  }

  getUser() async {
   user.value = await Auth().getUserProfile();
   update();
  }

}