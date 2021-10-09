import 'package:get/get.dart';
import 'package:pazar_iraq/app/data/provider/api_provider/auth_provider.dart';
import 'package:pazar_iraq/app/model/user.dart';

class AuthController extends GetxController {
  var isLoading=false.obs;
  UserModel user = UserModel();


  signIn(int signInTypeId,String otp) async {
  user=await Auth().signIn(signInTypeId, otp);
  }

  phoneVerification(String phoneNumber) async {
    await Auth().signInWithPhoneNumber(phoneNumber);
  }

}